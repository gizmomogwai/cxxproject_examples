cxx_configuration do
  static_lib "1",
    :sources => FileList['*.cpp'],
    :includes => ['.'],
    :whole_archive => false
end
