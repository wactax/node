#!/usr/bin/env coffee

> msgpackr > unpack

export default (
  redis
  stream
  group
  customer
  idle
  limit
)=>
  xpendclaim = redis.xpendclaim(
    stream
    group
    customer
  ).bind(
    undefined
    idle
  )
  (limit)->
    b = await xpendclaim(limit)
    if not b
      return

    b = Buffer.from b
    b0 = b[0]

    if b0 > 6
      console.error "ERROR xpendclaim ", b
      return

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
