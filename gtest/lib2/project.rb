cxx_configuration do
  static_lib 'lib2',
    :sources => ['lib2.cpp'],
    :dependencies => ['lib1'],
    :includes => ['.']
end
