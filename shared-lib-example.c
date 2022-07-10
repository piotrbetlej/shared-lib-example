#include "shared-lib-example.h"
#include <stdio.h>

int shared_lib_example_say_hello(void)
{
	printf("Here is %s", __FILE__);
	return 0;
}
