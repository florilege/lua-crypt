Lua bindings for `crypt()` POSIX function. See `man 3 crypt` for more info.

## Installation 

The Makefile provided will build a shared library called `libluacrypt.so`

## Usage
```
local crypto = require("luacrypt")
local salt = "xy"
local encrypted = crypt("clear", salt)
```
See `example.lua`
