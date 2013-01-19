cxx_configuration do
  foo = shared_lib 'foo',
        :sources => ['foo.cpp']
  
  bar = shared_lib 'bar',
        :major => 1,
        :minor => 2,
        :sources => ['bar.cpp']
  
  exe 'main',
    :sources => ['main.cpp'],
    :dependencies => ['foo', 'bar']
end
