projects = ['frazzle', 'cxxproject', 'cxxproject_gcctoolchain', 'cxxproject_clangtoolchain', 'rubydsl', 'cxxproject_console']
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

task :default => :install_gems
