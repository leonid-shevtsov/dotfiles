#!/usr/bin/env ruby

require 'rubygems'
require 'active_support/core_ext'

pattern = ARGV[0]
if File.directory?(pattern)
  pattern += "/*"
end

files = Dir.glob(pattern).map do |filename|
  mtime = Time.parse(`git log --format="%ad" --date=iso -1 #{filename}`)
  [filename, mtime]
end

files.sort! {|a,b| a[1] <=> b[1] }

files.each do |filename, mtime|
  puts "%20s %s" % [mtime.to_s(:db), filename]
end
