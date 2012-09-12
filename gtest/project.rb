cxx_configuration do
  source_lib 'small-tests',
    :sources => ['small-tests.cpp'],
    :dependencies => ['gtest'],
    :whole_archive => true
  source_lib 'small-tests2',
    :sources => ['small-tests2.cpp'],
    :dependencies => ['gtest']

  exe 'all-tests',
    :dependencies => ['small-tests', 'small-tests2', 'gtest_main']

end
