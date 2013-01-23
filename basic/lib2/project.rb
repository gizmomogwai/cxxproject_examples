cxx_configuration do
  if Cxxproject::Utils::OS.linux?
    deps = ['1'] + bin_libs([:z, :dl])
  else
    deps = ['1'] + bin_libs([:z])
  end

  static_lib "2",
    :sources => FileList['**/*.cpp'],
    :dependencies => deps,
    :includes => ['.'],
    :whole_archive => false

  unittest_flags = {
    :DEFINES => ['UNIT_TEST','CPPUNIT_MAIN="main"']
  }
  static_lib "2_debug",
    :sources => FileList['**/*.cpp'],
    :dependencies => deps,
    :includes => ['.'],
    :toolchain => Provider.modify_cpp_compiler('gcc', unittest_flags)
end
