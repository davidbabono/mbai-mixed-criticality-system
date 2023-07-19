#include "mylib1.h"
#include "mylib3.h"

int main() {
    int x = lib1_func2();
    int y = lib3_func1(x);
    return lib1_func1(y);
}

