#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include "binary.h"

int main(int argc, char *argv[])
{
	int opt;
	int opt_x=0, opt_o=0, opt_b=0;
	int i;
	
	while ((opt=getopt(argc, argv, "xob")) != -1) {
		switch (opt) {
			case 'x':opt_x=1; break;
			case 'o':opt_o=1; break;
			case 'b':opt_b=1; break;
			default:
				fprintf(stderr, "Usage: %s [-x] [-o] [-b] number ...\n", argv[0]);
		}
	}

	if (!opt_x && !opt_o && !opt_b) {
		fprintf(stderr, "Usage: %s [-x] [-o] [-b] number ...\n", argv[0]);
		return 1;
	}

	if (optind >= argc) {
		fprintf(stderr, "숫자를 하나 이상 입력하세요.\n");
		return 1;
	}

	for (i=optind; i<argc; i++){
		int value=atoi(argv[i]);
		printf("%d ->", value);
		if (opt_x) printf( " 16진수: %x", value);
		if (opt_o) printf(" 8진수: %o", value);
		if (opt_b) { printf(" 2진수: "); binary(value); }
		printf("\n");
	}
	return 0;
}
