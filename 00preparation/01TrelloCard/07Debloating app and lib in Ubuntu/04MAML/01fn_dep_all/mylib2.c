// lib2.c
#include "mylib3.h"

int lib2_func1() {
    return lib3_func2() + 3;
}

int lib2_func2() {
    return lib3_func1() + 4;
}

