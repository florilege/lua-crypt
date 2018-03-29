/*
 * luacrypt (c) 2004 Alexandre Erwin Ittner <aittner@netuno.com.br>
 * Binds the crypt() function to Lua. Like Lua, this program is released
 * under the MIT license (see http://www.lua.org/copyright.html).
 * WITHOUT ANY WARRANTY.
 *
 */

#include <lua.h>
#define _XOPEN_SOURCE
#include <unistd.h>

static int mycrypt(lua_State *L)
{
    const char *key;
    const char *salt;

    if(lua_gettop(L) != 2)
    {
        lua_pushstring(L, "Bad argument number");
        lua_error(L);
        return 1;
    }

    if((key = lua_tostring(L, 1)) == NULL)
    {
        lua_pushstring(L, "Bad key");
        lua_error(L);
        return 1;
    }

    if((salt = lua_tostring(L, 2)) == NULL)
    {
        lua_pushstring(L, "Bad salt");
        lua_error(L);
        return 1;
    }

    lua_pushstring(L, crypt(key, salt));
    return 1;
}


int luaopen_crypt(lua_State *L)
{
    lua_register(L, "crypt", mycrypt);
    return 0;
}

