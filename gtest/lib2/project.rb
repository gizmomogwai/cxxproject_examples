cxx_configuration do
  source_lib 'lib2',
    :sources => ['lib2.cpp'],
    :dependencies => ['lib1'],
    :includes => ['.']
end
