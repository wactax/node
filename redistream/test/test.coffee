#!/usr/bin/env coffee

> @w5/redis/MQ
  @w5/redis_lua/dot_bind.js
  @w5/redistream/XPENDCLAIM.js
  @w5/read
  @w5/redis_lua
  @w5/uridir
  # ./stream
  path > join dirname

ROOT = dirname uridir import.meta
await RedisLua(MQ).xpendclaim(
  read join(ROOT,'xpendclaim.lua')
)


B = DotBind(MQ)
B.fbin.xpendclaim

stream = 'civitai_img'
idle = 900 * 1e3
limit = 1

xpendclaim = XPENDCLAIM(
  MQ
  stream
  'C',
  'test'
  idle
)

for await i from xpendclaim(limit)
  console.log i

process.exit()
