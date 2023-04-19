#!/usr/bin/env coffee

< (redis)=>
  new Proxy(
    {}
    get:(_, stream)=>
      (args...)=>
        redis.xadd(stream, "*", ...args)
  )
