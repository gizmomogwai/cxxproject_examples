#!/bin/bash -v
mkdir -p out/libs
g++ -c -fPIC lib1.cpp -o out/lib1.o
g++ -shared -o out/libs/liblib1.so out/lib1.o
g++ -c main.cpp -o out/main.o
g++ -o out/main.exe out/main.o -Lout/libs -llib1
