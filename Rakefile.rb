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
      sh 'rm -rf pkg'
    end
  end
end

desc 'install prerequisites for build'
task :wipe_gems do
  sh "rvm --force gemset empty"
end

desc 'reinstall all gems into gemset'
task :reinstall_gems => :wipe_gems do
  Needed_Gems = [
    'rspec'
    # 'mime-types',
    # 'posix-spawn'
    # 'grit',
    # 'sexp_processor',
    # 'ruby_parser',
    # 'roodi',
    # 'haml',
    # 'gem-release'
  ]
  Needed_Gems.each do |g|
    sh "gem install #{g}"
  end
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

desc 'setup environment'
task :environment => [:reinstall_gems, :clean, :build_and_install_gems]


desc 'bump allgems'
task :bump do
  projects.each do |p|
    cd "../#{p}" do
      sh 'gem bump'
    end
  end
end

desc 'show all versions'
task :show_versions do
  projects.each do |p|
    cd "../#{p}", :verbose => false do
      require 'gem_release'
      version = GemRelease::VersionFile::new
      puts "#{p} has version #{version.old_number}"
    end
  end
end

desc 'pushes all gems to rubygems and bumps afterwards to be safe'
task :push_gems, [:what] => [:build_and_install_gems] do |t,args|
  projects_to_do = projects
  projects_to_do = [args.what] if args.what
  ok = ['']
  failed = ['']
  projects_to_do.each do |p|
    cd "../#{p}" do
      begin
        require 'gem_release'
        version = GemRelease::VersionFile.new.old_number
        sh "gem push pkg/#{p}-#{version}.gem"
        ok << p
        sh "git tag #{version}"
        sh "gem bump"
      rescue Exception => e
        failed << p
        puts "Problems with gem #{p}"
        puts e
      end
    end
  end
  puts "---------------------------"
  puts "RESULTS"
  puts "---------------------------"
  puts "Sucessfully pushed gems:#{ok.join("\n  ")}"
  puts "Failed to push gems    :#{failed.join("\n  ")}"
  if failed.size == 0
    puts "pushing tags"
    sh "repo forall -c git push --tags"
  end
end

task :default => :build_and_install_gems

task :test do |t, args|
  p args
  cd '../cxxproject' do
    sh 'gem bump'
  end
end
