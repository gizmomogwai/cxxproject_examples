cxx_configuration do
  static_lib "1",
    :sources => FileList['*.cpp'],
    :includes => ['.'],
    :output_dir => 'build',
    :whole_archive => false
end
