cxx_configuration do
  foo = shared_lib 'foo',
        :sources => ['foo.cpp']
  
  bar = shared_lib 'bar',
        :major => 'A',
        :minor => '1.0.2',
        :compatibility => '1.0.1',
        :sources => ['bar.cpp'],
        :dependencies => ['foo']
  
  exe 'main',
    :sources => ['main.cpp'],
    :dependencies => ['foo', 'bar']
end
