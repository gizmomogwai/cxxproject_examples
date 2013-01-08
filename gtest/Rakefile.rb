require 'cxx'

flags = {
  :FLAGS => ['-coverage']
}

cxx(Dir['**/project.rb'] , 'out', 'gcc', '.') do
  Provider.modify_compiler("gcc", :C, flags)
  Provider.modify_compiler("gcc", :CPP, flags)
  Provider.modify_linker("gcc", flags)
end


