cxx_configuration do
  static_lib "lazy",
    :sources => FileList['../src/*.cpp'],
    :includes => ['.'],
    :whole_archive => true
end
