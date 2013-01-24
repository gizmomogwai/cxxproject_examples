#!/bin/bash -v
# for osx this seems to be a good tutorial
# https://developer.apple.com/library/mac/#documentation/DeveloperTools/Conceptual/DynamicLibraries/100-Articles/CreatingDynamicLibraries.html#//apple_ref/doc/uid/TP40002073-SW1
#http://blog.zyxar.com/tag/executable_path
#https://wincent.com/wiki/@executable_path,_@load_path_and_@rpath
#http://www.mikeash.com/pyblog/friday-qa-2009-11-06-linking-and-install-names.html
major=A
minor=1.0.1
compatibility=1.0.0
mkdir -p out/libs

#Without major/minor
g++ -c foo.cpp -o out/foo.o
g++ -dynamiclib -o out/libs/libfoo.dylib -install_name @executable_path/libs/libfoo.dylib out/foo.o

#With major/minor
g++ -c bar.cpp -o out/bar.o
g++ -dynamiclib -o out/libs/libbar.$major.dylib -install_name @executable_path/libs/libbar.$major.dylib out/bar.o -compatibility_version $compatibility -current_version $minor out/libs/libfoo.dylib
pushd out/libs
ln -s libbar.$major.dylib libbar.dylib
popd

#Executable
g++ -c main.cpp -o out/main.o
g++ -o out/main out/main.o -lfoo -lbar -Lout/libs/
