#include <math.h>

double gVar;

double set_var(float f32Var)
{
    gVar = ceil(f32Var);
    return gVar;
}  

double unused_function(float f32Var)
{
    return f32Var * 2.0;
}

