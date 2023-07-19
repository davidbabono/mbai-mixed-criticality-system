// lib1.c
#include "mylib2.h"

int lib1_func1() {
    return lib2_func2() + 1;
}

int lib1_func2() {
    return lib2_func1() + 2;
}

