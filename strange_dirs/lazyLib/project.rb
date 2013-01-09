cxx_configuration do
  source_lib "lazy",
    :sources => FileList['../src/*.cpp'],
    :includes => ['.'],
    :whole_archive => true
end
