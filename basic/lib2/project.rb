cxx_configuration do
  if Cxxproject::Utils::OS.linux?
    deps = ['1'] + bin_libs([:dl])
  else
    deps = ['1'] + bin_libs([])
  end

  static_lib "2",
    :sources => FileList['**/*.cpp'],
    :dependencies => deps,
    :includes => ['.'],
    :whole_archive => false

  static_lib "2_debug",
    :sources => FileList['**/*.cpp'],
    :dependencies => deps,
    :includes => ['.']
end
