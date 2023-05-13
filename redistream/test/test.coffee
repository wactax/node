#!/usr/bin/env coffee

> @w5/redis/MQ
  @w5/redis_lua/dot_bind.js
  @w5/read
  @w5/redis_lua
  @w5/uridir
  path > join dirname

ROOT = dirname uridir import.meta
await RedisLua(MQ).xpendclaim(
  read join(ROOT,'xpendclaim.lua')
)


B = DotBind(MQ)
B.fbin.xpendclaim

# stream = 'civitai_img'

li = await MQ.xpendclaim(
  stream # stream
  'C' # group
  'test' # 消费者
)(
  1e3 # idle
  2 # limit
)
console.log li
