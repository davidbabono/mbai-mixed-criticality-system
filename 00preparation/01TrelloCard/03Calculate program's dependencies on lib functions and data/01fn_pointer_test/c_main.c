#include <stdio.h>

typedef void (*func_ptr)();

extern void registerFunctionPtr(func_ptr fp);
extern void indirectCall();
extern void funcB();

int main() {
    registerFunctionPtr(funcB);
    indirectCall();
    return 0;
}
