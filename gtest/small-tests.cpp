#include <gtest/gtest.h>

#include "lib1.h"

TEST(Hello, world1) {
  EXPECT_EQ(1, 1);
}

TEST(Hello, world2) {
  EXPECT_EQ(1, 1);
}

TEST(Lib1, f1) {
  Lib1 lib1;
  EXPECT_EQ(1, lib1.f1());
}

TEST(Lib1, f2) {
  Lib1 lib1;
  EXPECT_EQ(2, lib1.f2());
}

