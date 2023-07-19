#include <stdio.h>

void myFunction() {
    printf("Hello from myFunction!\n");
}

void (*getFunctionPtr())() {
    return &myFunction;
}

