#!/usr/bin/env coffee

> @w5/redis_lua
  ./fail_table.js

< (redis,stream)=>
  Promise.all [
    RedisLua(redis).xpendclaim(
      (
        await import('./xpendclaim.js')
      ).default
    )
    FailTable stream
  ]
