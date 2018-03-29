CCi      = gcc
WARNS    = -Wall -Wextra -pedantic -Werror -Wno-unused-parameter
CFLAGS   = $(WARNS) -shared -fPIC
LIBS     = -lcrypt -llua5.1
INCLUDES = -I/usr/include/lua5.1 

all: libluacrypt.so

libluacrypt.so: luacrypt.c
	$(CC) $(CFLAGS) $(INCLUDES) -o luacrypt.so  luacrypt.c $(LIBS)
clean:
	rm -f libluacrypt.so
