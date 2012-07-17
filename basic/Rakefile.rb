require 'cxx'

cxx(Dir['**/project.rb'] , 'out', 'g++', '.')
