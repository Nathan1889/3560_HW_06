CC = g++
CFLAGS = -g -Wall
all: build archive
build: game
game: game.o main.o othello.o
	$(CC) $(CFLAGS) *.o -o game
%.o: %.cc %.h
	$(CC) $(CFLAGS) -c $<
othello.h: game.h colors.h piece.h
	touch othello.h
main.o: main.cc othello.h game.h
	$(CC) $(CFLAGS) -c main.cc
clean:
	rm -f *.o core *.out *.tmp *.core game *.tar 
archive: 
	-tar -cvzf HW5.tar colors.h game.cc othello.h othello.cc main.cc piece.h game.h makefile
