CFLAGS := -fPIC -shared -lcurses # -undefined dynamic_lookup
CC := gcc

.DEFAULT_GOAL := libdart_curses.so

libdart_curses.so: dart_curses.c
	$(CC) -I/usr/lib/dart $(CFLAGS) -o $@ $^
