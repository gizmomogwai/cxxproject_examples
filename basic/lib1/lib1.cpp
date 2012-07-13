#include "lib1.h"
#include <cstring>
#include <iostream>

bool b() {
  bool res;
  return res;
}

void lib1() {
  const char* warning = "123";
  std::cout << "lib1" << std::endl;
  bool b;
  int i;
  if (b) {
    i = 5;
  }
  i++;
  std::cout << i << std::endl;
}
