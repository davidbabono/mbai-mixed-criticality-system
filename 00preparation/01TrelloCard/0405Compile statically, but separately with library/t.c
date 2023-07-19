int foo(void);
int baz(void);
int fn(int (*fnptr)(void));

int main(void) { return foo() + fn(baz); }
