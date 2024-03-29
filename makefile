CC = g++
CFLAGS = -Wall -m64 -std=c++11

all: main.o PicturesToAlphaBlending.o x86_function.o -lsfml-graphics -lsfml-window -lsfml-system
	$(CC) $(CFLAGS) -o program main.o x86_function.o -lsfml-graphics -lsfml-window -lsfml-system

PicturesToAlphaBlending.o: PicturesToAlphaBlending.h
	$(CC) $(CFLAGS) -c -o PicturesToAlphaBlending.o PicturesToAlphaBlending.h

x86_function.o: x86_function.s
	nasm -f elf64 -o x86_function.o x86_function.s

main.o: main.cpp
	$(CC) $(CFLAGS) -c -o main.o main.cpp

clean:
	rm -f *.o

