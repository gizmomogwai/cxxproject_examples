#include "lib2.h"

#include <iostream>
#include <math.h>
#include "lib1.h"
#include <dlfcn.h>

void lib2() {
  lib1();
  std::cout << sin(5) << std::endl;
  void* help = dlopen("test", RTLD_LAZY);
}
