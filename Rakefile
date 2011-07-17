require 'rake'
require 'fileutils'
require 'erb'

WINDOWS_FILE_MAP = {
  '.bin' => :skip,
  '.gitk' => :skip,
  '.gvimrc' => '_gvimrc',
  '.htop' => :skip,
  '.mytop' => :skip,
  '.pivotalrc' => :skip,
  '.profile' => :skip,
  '.screenrc' => :skip,
  '.vim' => 'vimfiles',
  '.vimrc' => '_vimrc',
  '.Xdefaults' => :skip,
  '.zshenv' => :skip,
  '.zshrc' => :skip,
  
}

desc "install the dot files into user's home directory"
task :install do
  replace_all = false
  Dir['*'].each do |file|
    next if %w[Rakefile README.md].include?(file)

    target_file = target_filename(file)

    next if target_file==:skip
    
    if File.exist?(target_file)
      if File.identical? file, target_file 
        puts "identical #{target_file}"
      elsif replace_all
        replace_file(file, target_file)
      else
        print "overwrite #{target_file}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(file, target_file)
        when 'y'
          replace_file(file, target_file)
        when 'q'
          exit
        else
          puts "skipping #{target_file}"
        end
      end
    else
      link_file(file, target_file)
    end
  end
  if is_windows?
    exec 'ruby ./.post-install-win.rb'
  else
    exec './.post-install'
  end
end

def replace_file(file, target_file)
  if is_windows? && File.directory?(target_file)
    system %Q{rmdir /s /q "#{target_file}"}
  else
    FileUtils.rm_rf target_file
  end
  link_file file, target_file
end

def link_file(file, target_file)
  if file =~ /.erb$/
    puts "generating #{target_file}"
    File.open(target_file, 'w') do |new_file|
      new_file.write ERB.new(File.read(file)).result(binding)
    end
  else
    puts "linking #{target_file}"
    if is_windows?
      system %Q{cmd /c mklink #{File.directory?(file) ? '/d ' : ''} "#{target_file.gsub('/','\\')}" "#{File.join(Dir.pwd,file).gsub('/','\\')}"}
    else
      system %Q{ln -s "$PWD/#{file}" "#{target_file}"}
    end
  end
end

def is_windows?
  (RUBY_PLATFORM =~ /win32/) || (RUBY_PLATFORM =~ /mingw32/)
end

def skip_file_on_windows(file)
end

def target_filename(filename)

  filename_without_erb = '.'+filename.gsub(/\.erb$/, '')
  
  filename_without_erb = WINDOWS_FILE_MAP[filename_without_erb] if is_windows? && WINDOWS_FILE_MAP[filename_without_erb]

  filename_without_erb==:skip ? :skip : File.join(ENV['HOME'], filename_without_erb)
end
