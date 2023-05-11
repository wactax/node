#!/usr/bin/env coffee

> @w5/uridir
  @w5/read
  path > join
  @w5/redis_lua
  @w5/redis_lua/dot_bind.js

ROOT = uridir(import.meta)
LUA = read join ROOT,'redis.lua'

redis = {
  fbinR:=>
    new Uint8Array([])
  fnload:(lua)=>
    console.log lua
    return
  fstr:(args...)=>
    console.log 'fstr', ...args
    return
}


await RedisLua(redis).RedisLuaTest LUA

console.log '---'

BIND = DotBind redis

BIND.fstr.ipLimit

await redis.ipLimit('key1','key2')('arg1','arg2')
