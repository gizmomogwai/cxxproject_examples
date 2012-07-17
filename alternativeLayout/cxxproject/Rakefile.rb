require 'cxx'
cxx(FileList['**/*project.rb'], 'out', 'gcc', '..')
