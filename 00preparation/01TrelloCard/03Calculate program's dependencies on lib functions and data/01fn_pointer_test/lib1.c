#include <stdio.h>

typedef void (*func_ptr)();

func_ptr myFunctionPtr;

void registerFunctionPtr(func_ptr fp) {
    myFunctionPtr = fp;
}

void indirectCall() {
    myFunctionPtr();
}

