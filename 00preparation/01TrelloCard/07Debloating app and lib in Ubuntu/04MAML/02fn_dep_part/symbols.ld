SECTIONS
{
    . = ALIGN(4);
    KEEP(*(sharelib__GLOBAL_OFFSET_TABLE_));
    . = ALIGN(4);
    KEEP(*(sharelib_lib1_func1));
    . = ALIGN(4);
    KEEP(*(sharelib_lib1_func2));
    . = ALIGN(4);
    KEEP(*(sharelib_lib2_func1));
    . = ALIGN(4);
    KEEP(*(sharelib_lib3_func1));
}
