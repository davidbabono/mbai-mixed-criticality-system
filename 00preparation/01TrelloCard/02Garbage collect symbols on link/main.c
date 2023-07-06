#include <math.h>
#include <stdio.h>

double gVar;
  
double set_var(float f32Var)
{
	gVar = ceil(f32Var);
	return gVar;
}  

double unused_function(float f32Var)
{
    printf("value1 = %.1lf\n", fabs(f32Var * 2.0));
    return ceil(f32Var * 2.0);
}

  
int main()
{
    float val1;
  
    val1 = 1.6;
  
    printf("value1 = %.1lf\n", set_var(val1));
  
    return (0);
}
