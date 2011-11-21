#include <stdio.h>


extern "C" void gradient_c_(double* phi, int& nx)
{
	printf("nx= %d\n", nx);
	printf("phi[2] = %f\n", phi[2]);
	return;
}

