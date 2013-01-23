cxx_configuration do
  static_lib "lang",
    :sources => FileList['**/*.cpp'],
    :includes => [".."]
end
