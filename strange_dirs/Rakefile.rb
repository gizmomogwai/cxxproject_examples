require 'cxx'
cxx(Dir.glob('**/*project.rb'), "build", "gcc", ".")
