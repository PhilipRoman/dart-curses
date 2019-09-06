CFLAGS := -Wall -Wextra -pedantic -std=c99 -fPIC -shared -lcurses # -undefined dynamic_lookup
CHECKFLAGS := --enable=all --check-config --force --std=c99
CC := gcc

.DEFAULT_GOAL := libdart_curses.so
.PHONY: check clean

libdart_curses.so: dart_curses.c
	$(CC) -I/usr/lib/dart/ $(CFLAGS) -o $@ $^

check: dart_curses.c
	@which cppcheck > /dev/null || (echo "cppcheck not found"; exit 1)
	cppcheck -I/usr/lib/dart/ -I/usr/include/ $^

clean:
	rm -v libdart_curses.so || true
