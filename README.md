luacrypt is a C library that binds the crypt() function from POSIX
operating systems to the standard Lua 5.0 interpreter.


##Installation 

The Makefile provided with the package will build a shared library called
'libluacrypt.so'

```
local crypto = require("luacrypt")
```

##Usage

The library has only a 'crypt()' function, that makes what you're
thinking. See `man 3 crypt` for more information.

GNU libc has a extension that allows a md5 based encryption, that are
more secure than the standard DES one. From the GNU libc manual:

   "The glibc2 version of this function has the following  additional  fea-
    tures.   If  salt is a character string starting with the three charac-
    ters "$1$" followed by at most eight characters, and optionally  termi-
    nated  by  "$",  then instead of using the DES machine, the glibc crypt
    function uses an MD5-based algorithm,  and  outputs  up  to  34  bytes,
    namely  "$1$<string>$", where "<string>" stands for the up to 8 charac-
    ters following "$1$" in the salt, followed by 22 bytes chosen from  the
    set [a-zA-Z0-9./].  The entire key is significant here (instead of only
    the first 8 bytes)."

##Licence

MIT, modified from original (c) Alexandre Erwin Ittner
