#!/bin/bash -v
# for osx this seems to be a good tutorial
# https://developer.apple.com/library/mac/#documentation/DeveloperTools/Conceptual/DynamicLibraries/100-Articles/CreatingDynamicLibraries.html#//apple_ref/doc/uid/TP40002073-SW1
#http://blog.zyxar.com/tag/executable_path
#https://wincent.com/wiki/@executable_path,_@load_path_and_@rpath
#http://www.mikeash.com/pyblog/friday-qa-2009-11-06-linking-and-install-names.html
mkdir -p out/libs
g++ -c lib1.cpp -o out/lib1.o
g++ -dynamiclib -o out/libs/liblib1.dylib -install_name @executable_path/libs/liblib1.dylib out/lib1.o
g++ -c main.cpp -o out/main.o
g++ -o out/main.exe out/main.o out/libs/liblib1.dylib
