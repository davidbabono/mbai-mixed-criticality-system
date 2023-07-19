#include "mylib1.h"
#include "mylib2.h"

int main() {
    int x = lib1_func1();
    int y = lib2_func1(x);
    return lib1_func2(y);
}

