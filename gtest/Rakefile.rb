require 'cxx'

flags = {
  :FLAGS => ['--coverage']
}

cxx(Dir['**/project.rb'] , 'out', 'gcc', '.') do |tc|
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
