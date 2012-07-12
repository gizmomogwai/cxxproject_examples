projects = ['frazzle', 'cxxproject', 'cxxproject_gcctoolchain', 'cxxproject_clangtoolchain', 'rubydsl', 'cxxproject_console', 'cxxproject_valgrind']
desc 'build all projects'
task :build do
  projects.each do |p|
    cd "../#{p}" do
      sh 'rake clobber_package package'
    end
  end
end

desc 'install all built gems'
task :install_gems => :build do
  sh "gem install #{FileList[projects.map{|p|"../#{p}/pkg/*.gem"}].join(' ')}"
end

desc 'pushes all gems to rubygems'
task :push_gems => :build do
  FileList[projects.map{|p|"../#{p}/pkg/*.gem"}].each do |gem|
    begin
      sh "gem push #{gem}"
    rescue Exception => e
      puts "problems with pushing gem #{gem}:"
      puts e
    end
  end
end

task :default => :install_gems
