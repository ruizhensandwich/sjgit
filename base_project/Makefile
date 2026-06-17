CC = gcc
CFLAGS = -Wall -g

base : base.o binary.o

base.o: base.c binary.h

binary.o: binary.c binary.h

clean:
	rm -f base base.o binary.o
