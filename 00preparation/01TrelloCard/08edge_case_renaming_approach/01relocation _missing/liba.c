#include <stdio.h>
void foo() {
    printf("This is foo in liba.c\n");
}

void lib_foo() {
    foo();
}

