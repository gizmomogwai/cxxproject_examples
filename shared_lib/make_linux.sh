#!/bin/bash -v
# seems to be the reference: http://tldp.org/HOWTO/Program-Library-HOWTO/shared-libraries.html
# it would be probably wise to add some versioning flags to dynamic_lib
mkdir -p out/libs
g++ -c -fPIC lib1.cpp -o out/lib1.o
g++ -shared -Wl,-soname,liblib1.so -o out/libs/liblib1.so out/lib1.o
g++ -c main.cpp -o out/main.o
g++ -o out/main.exe out/main.o -Lout/libs -llib1
