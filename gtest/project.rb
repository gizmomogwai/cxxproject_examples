cxx_configuration do
  source_lib 'small-tests',
    :sources => ['small-tests.cpp'],
    :dependencies => ['gtest'],
    :whole_archive => true

  exe 'all-tests',
    :dependencies => ['small-tests','gtest_main']

end
