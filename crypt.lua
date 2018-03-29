-- Loading the library. libluacrypt.so must be on ld path.
load_crypt = assert(loadlib("libluacrypt.so", "luaopen_crypt"))
load_crypt()

-- Checking passwords.
passwd = crypt("right", "xz")
if crypt("right", passwd) == passwd then
  print("Right password")
else
  print("Wrong password")
end

-- Testing POSIX and GNU features.
print("Standard POSIX, DES based, crypt: " .. crypt("test", "ab"))
print("GNU libc, MD5 based, crypt: " .. crypt("test", "$1$blerg"))

-- Using a pseudo-random (and pseudo-secure) salt. 
math.randomseed(os.time())
slt = "$1$" .. string.gsub(math.random(), "0%.", "")
print("Using a pseudo-random salt: " .. crypt("test", slt))

