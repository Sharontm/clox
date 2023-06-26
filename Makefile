CC = gcc
Flags = -Wall -O3

all: chunk.o debug.o memory.o value.o vm.o
	$(CC) $(Flags) -o clox main.c chunk.o debug.o memory.o value.o vm.o

chunk: chunk.h memory.h
	$(CC) $(Flags) -o chunk.o chunk.c

debug: debug.h value.h
	$(CC) $(Flags) -o debug.o debug.c

memory: memory.h
	$(CC) $(Flags) -o memory.o memory.c

value: value.h memory.h
	$(CC) $(Flags) -o value.o value.c

vm: vm.h debug.h common.h
	$(CC) $(Flags) -o vm.o vm.c

clean:
	rm clox *.o 