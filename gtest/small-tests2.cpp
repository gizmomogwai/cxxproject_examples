#include <gtest/gtest.h>

#include "lib2.h"

TEST(Hello2, world1) {
  EXPECT_EQ(1, 1);
}

TEST(Hello2, world2) {
  EXPECT_TRUE(true);
}

TEST(Lib2, f1) {
  Lib2 lib2;
  EXPECT_EQ(2, lib2.f1());
}
