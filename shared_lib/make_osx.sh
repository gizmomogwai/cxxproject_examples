#!/bin/bash -v
# for osx this seems to be a good tutorial
# https://developer.apple.com/library/mac/#documentation/DeveloperTools/Conceptual/DynamicLibraries/100-Articles/CreatingDynamicLibraries.html#//apple_ref/doc/uid/TP40002073-SW1
#http://blog.zyxar.com/tag/executable_path
#https://wincent.com/wiki/@executable_path,_@load_path_and_@rpath
#http://www.mikeash.com/pyblog/friday-qa-2009-11-06-linking-and-install-names.html
major=1
minor=2
mkdir -p out/libs

#Without major/minor
g++ -c foo.cpp -o out/foo.o
g++ -dynamiclib -o out/libs/libfoo.dylib -install_name @executable_path/libs/libfoo.dylib out/foo.o

#With major/minor
g++ -c bar.cpp -o out/bar.o
g++ -dynamiclib -o out/libs/libbar.dylib -install_name @executable_path/libs/libbar.dylib out/bar.o -compatibility_version 1 -current_version 1.2 out/libs/libfoo.dylib
pushd out/libs
ln -s libbar.$major.$minor.dylib libbar.dylib
ln -s libbar.$major.$minor.dylib libbar.$major.dylib
popd

#Executable
g++ -c main.cpp -o out/main.o
g++ -o out/main.exe out/main.o out/libs/libfoo.dylib out/libs/libbar.dylib
