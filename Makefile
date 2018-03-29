# luacrypt (c) 2004 Alexandre Erwin Ittner <aittner@netuno.com.br>
# Binds the crypt() function to Lua. Like Lua, this program is released
# under the MIT license (see http://www.lua.org/copyright.html).
# WITHOUT ANY WARRANTY.


CC=gcc
WARNS = -Wall -Wextra -pedantic -Werror -Wno-unused-parameter
CFLAGS= $(WARNS) -shared -fPIC
LIBS = -lcrypt -llua5.1
INCLUDES= -I/usr/include/lua5.1 

all: libluacrypt.so

libluacrypt.so: luacrypt.c
	$(CC) $(CFLAGS) $(INCLUDES) -o luacrypt.so  luacrypt.c $(LIBS)

install: libluacrypt.so
	cp libluacrypt.so /usr/lib/

clean:
	rm -f libluacrypt.so *.o
