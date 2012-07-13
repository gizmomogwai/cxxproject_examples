#include <iostream>

bool a() {
  bool b;
  return b;
}
void lib11() {
  int i;
  if (a()) {
    i = 5;
  }
  std::cout << i << std::endl;
}
