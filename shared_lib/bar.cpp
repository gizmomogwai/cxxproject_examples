#include "foo.h"
#include "bar.h"

#include <stdio.h>

void bar() {
  foo();
  printf("bar\n");
}
