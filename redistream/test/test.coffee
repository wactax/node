#!/usr/bin/env coffee

> @w5/redis/MQ
  @w5/redis_lua/dot_bind.js
  @w5/read
  @w5/redis_lua
  @w5/uridir
  ./stream
  msgpackr > unpack
  path > join dirname

ROOT = dirname uridir import.meta
await RedisLua(MQ).xpendclaim(
  read join(ROOT,'xpendclaim.lua')
)


xpendclaim = (redis, stream, group, customer)->
  b = Buffer.from await redis.xpendclaim(
    stream
    group
    customer
  )(
    1e3 # idle
    2 # limit
  )

  b0 = b[0]
  len = b.readUIntLE(
    1
    b0
  )
  begin = 1 + b0
  end = begin + len

  n = 0
  li = unpack b.slice(begin, end)
  while n < li.length
    n5 = n + 5
    [retry, t0, t1, klen,vlen] = li.slice(n,n5)
    n = n5
    begin = end
    end += klen
    id = unpack b.slice(begin, end)
    begin = end
    end += vlen
    msg = unpack b.slice(begin, end)
    yield [retry, t0+'-'+t1, id, msg]
  return

B = DotBind(MQ)
B.fbin.xpendclaim

for await i from xpendclaim(MQ, stream, 'C','test')
  console.log i

process.exit()
