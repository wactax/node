#!/usr/bin/env coffee

> @w5/redis_lua

< (redis)=>
  RedisLua(redis).xpendclaim(
    (
      await import('./xpendclaim.js')
    ).default
  )


