require 'cxx'

cxx(Dir['**/project.rb'], 'out', "gcc", './') do |tc|
end

