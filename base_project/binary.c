#include <stdio.h>
#include "binary.h"

void binary(int value)
{
	unsigned int mask;
	int started =0;
	
	if (value == 0) {
		printf("0");
		return;
	}
	mask = 1u << 31;
	
	while (mask != 0) {
		if (((unsigned int)value&mask)!=0) {
			printf("1");
			started=1;
		} else if (started) {
			printf("0");
		}
		mask >>=1;
	}
}
