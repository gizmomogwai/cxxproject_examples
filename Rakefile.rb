projects = ['frazzle',
            'cxxproject',
            'cxx',
            'cxxproject_gcctoolchain',
            'cxxproject_clangtoolchain',
            'cxxproject_clanganalyzer',
            'cxxproject_stats',
            'cxxproject_console',
            'cxxproject_valgrind']

desc 'cleanup all built gems'
task :clean do
  projects.each do |p|
    cd "../#{p}" do
      sh 'rake clobber_package'
    end
  end
end

desc 'install prerequisites for build'
task :wipe_gems do
  sh "rvm --force gemset empty"
end

desc 'install all built gems'
task :build_and_install_gems do
  projects.each do |p|
    cd "../#{p}" do
      sh 'rm -rf pkg'
      sh 'rake package'
      sh 'rake install'
    end
  end

#  sh "gem install #{FileList[projects.map{|p|"../#{p}/pkg/*.gem"}].join(' ')}"
end

desc 'bump allgems'
task :bump do
  projects.each do |p|
    cd "../#{p}" do
      sh 'gem bump'
    end
  end
end

desc 'pushes all gems to rubygems'
task :push_gems => :build_and_install_gems do
  ok = []
  failed = []
  FileList[projects.map{|p|"../#{p}/pkg/*.gem"}].each do |gem|
    begin
      sh "gem push #{gem}"
      ok << gem
    rescue Exception => e
      puts "problems with pushing gem #{gem}:"
      puts e
      failed << gem
    end
  end
  puts "Sucessfully pushed gems:\n  #{ok.join("\n  ")}"
  puts "Failed to push gems    :\n  #{failed.join("\n  ")}"
end

desc 'pushes gems and ups version after this to be on the safe side'
task :push_and_bump => [:push_gems] do
  projects.each do |p|
    cd "../#{p}" do
      sh 'gem bump'
    end
  end
end

task :default => :build_and_install_gems
