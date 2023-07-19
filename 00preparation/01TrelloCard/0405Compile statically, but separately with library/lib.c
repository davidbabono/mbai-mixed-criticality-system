int biz_global = 1;
int not_accessed_global = 2; /* set to non-zero to avoid BSS placement */
__attribute__((noinline)) int bar(void) { return 1; }
__attribute__((noinline)) int not_accessed_fn(void) { return 1; }
__attribute__((noinline)) int baz(void) { return biz_global; }
int foo(void) { return bar(); }
int fn(int (*fnptr)(void)) { return fnptr(); }
