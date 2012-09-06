cxx_configuration do

  source_lib 'gtest',
    :sources => FileList['fused-src/gtest/gtest-all.cc'],
    :includes => ['fused-src'],
    :dependencies => bin_libs('pthread', 'rt')

  source_lib 'gtest_main',
    :sources => FileList['fused-src/gtest/gtest_main.cc'],
    :dependencies => ['gtest']

end
