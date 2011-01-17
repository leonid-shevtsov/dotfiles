#!/usr/bin/env ruby

require 'etc'

windows_keyfile_dir = "D:\\users\\leonid\\keys\\"
keyfile_dir = File.expand_path('~/putty_keys')
puttygen = `which puttygen`.strip

default_ssh_port = 22
default_user = Etc.getpwuid.name

current_host = nil
hosts = {}

File.read(File.expand_path('~/.ssh/config')).each_line do |l|
  l.strip!
  next if l[0,1]=='#'

  option, value = l.split(' ',2)
  next if option.nil?

  value.strip!

  if option=='Host' and value != '*'
    current_host = value
    hosts[current_host] ||= {}
  elsif !current_host.nil?
    hosts[current_host][option] = value
  end
end

# Registry file header
puts %q(Windows Registry Editor Version 5.00)
puts 
puts %q([HKEY_CURRENT_USER\Software\SimonTatham\PuTTY\Sessions])

def registry_key(key, value)
  %Q("#{key}"=) + (value.is_a?(String) ? %Q("#{value.gsub("\"","\\\"").gsub(%q(\\),%q(\\\\\\\\))}") : %Q(dword:#{"%08x" % value}))
end

keyfiles = []

hosts.each do |session_name, options|
  host_name = options.fetch('HostName',session_name)
  port = options.fetch('Port', default_ssh_port).to_i
  user = options.fetch('User', default_user)
  keyfile = options.fetch('IdentityFile', nil)

  puts %Q([HKEY_CURRENT_USER\\Software\\SimonTatham\\PuTTY\\Sessions\\#{session_name}])
  puts registry_key('Protocol', 'ssh')
  puts registry_key('HostName', host_name)
  puts registry_key('UserName', user)
  puts registry_key('PortNumber', port)
  if keyfile
    puts registry_key('PublicKeyFile', windows_keyfile_dir+File.basename(keyfile)+'.ppk')
    keyfiles << keyfile
  end
end

keyfiles.uniq.each do |keyfile|
  STDERR.puts "Converting key: #{keyfile}"
  system("puttygen #{keyfile} -O private -o #{File.join(keyfile_dir,File.basename(keyfile))+'.ppk'} 1>&2")
end
