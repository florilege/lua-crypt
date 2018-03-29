# luacrypt (c) 2004 Alexandre Erwin Ittner <aittner@netuno.com.br>
# Binds the crypt() function to Lua. Like Lua, this program is released
# under the MIT license (see http://www.lua.org/copyright.html).
# WITHOUT ANY WARRANTY.


CC=gcc

all: libluacrypt.so

libluacrypt.so: luacrypt.c
	$(CC) -o libluacrypt.so -shared luacrypt.c -llua -lcrypt -Wall

install: libluacrypt.so
	cp libluacrypt.so /usr/lib/

clean:
	rm -f libluacrypt.so *.o
