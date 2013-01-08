#include "lib2.h"
#include "lib1.h"

int Lib2::f1() {
  Lib1 l1;
  return l1.f1() * 2;
}

int Lib2::f2() {
  return 4;
}

int Lib2::f3() {
  return 6;
}

