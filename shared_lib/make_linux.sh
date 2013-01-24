#!/bin/bash -v
# seems to be the reference: http://tldp.org/HOWTO/Program-Library-HOWTO/shared-libraries.html
# it would be probably wise to add some versioning flags to dynamic_lib
major=1
minor=2
mkdir -p out/libs

#Without major/minor
g++ -c -fPIC foo.cpp -o out/foo.o
g++ -shared -Wl,-soname,libfoo.so -o out/libs/libfoo.so out/foo.o

#With major/minor
g++ -c -fPIC bar.cpp -o out/bar.o
g++ -shared -Wl,-soname,libbar.$major.so -o out/libs/libbar.$major.$minor.so out/bar.o -lfoo -Lout/libs
pushd out/libs
ln -s libbar.$major.$minor.so libbar.so
ln -s libbar.$major.$minor.so libbar.$major.so
popd

#Executable
g++ -c main.cpp -o out/main.o
g++ -o out/main.exe out/main.o -Lout/libs -lfoo -lbar
