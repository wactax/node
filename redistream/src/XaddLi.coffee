#!/usr/bin/env coffee

< (redis)=>
  new Proxy(
    {}
    get:(_, stream)=>
      (li)=>
        p = redis.pipeline()
        for args from li
          p.xadd(stream, "*", ...args)
        p.exec()
  )
