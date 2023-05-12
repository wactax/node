#!/usr/bin/env coffee

> @w5/redis_lua
  ./redis.js
  ./fail_table.js

< (stream)=>
  Promise.all [
    RedisLua(redis).xpendclaim(
      (
        await import('./xpendclaim.js')
      ).default
    )
    FailTable stream
  ]
