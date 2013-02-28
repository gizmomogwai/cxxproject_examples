require 'cxx'

flags = {
  :FLAGS => ['--coverage']
}

cxx(Dir['**/project.rb'] , 'out/rpi', 'raspberrypi', '.') do |tc|
  tc[:COMPILER][:C].update(flags)
  tc[:COMPILER][:CPP].update(flags)
  tc[:LINKER].update(flags)
end

Gcov.excludes << '.*fused-src.*'
Gcov.excludes << '/usr.*'

desc 'cleanup gcov files'
task :clean_gcov do
  sh 'find . -name "*.gc??" -delete'
end

desc 'clean build + gcov + browser'
task :coverage => [:clean, 'run:all-tests', :gcov, :clean_gcov] do
  sh 'gnome-open out/gcov/html/index.html'
end

