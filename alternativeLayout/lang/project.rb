cxx_configuration do
  static_lib "io", :sources => FileList['**/*.cpp'], :includes => ".."
end
