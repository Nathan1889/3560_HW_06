CC = g++
CFLAGS = -g -Wall
all: build Doc
build: game
Doc: html
game: game.o main.o othello.o
	$(CC) $(CFLAGS) *.o -o game
%.o: %.cc %.h
	$(CC) $(CFLAGS) -c $<
othello.h: game.h colors.h piece.h
	touch othello.h
main.o: main.cc othello.h game.h
	$(CC) $(CFLAGS) -c main.cc
clean:
	rm -f *.o core *.out *.tmp *.core game *.tar -r html latex
html: game
	doxygen Doxyfile
