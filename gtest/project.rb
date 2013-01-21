cxx_configuration do
  static_lib 'small-tests',
    :sources => ['small-tests.cpp'],
    :dependencies => ['gtest', 'lib1'],
    :whole_archive => false

  static_lib 'small-tests2',
    :sources => ['small-tests2.cpp'],
    :dependencies => ['gtest', 'lib2'],
    :whole_archive => true

  exe 'all-tests',
    :dependencies => ['small-tests', 'small-tests2', 'gtest_main']

end
