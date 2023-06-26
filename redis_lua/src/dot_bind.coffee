#!/usr/bin/env coffee

> @w5/dot

DEBUG = process.env.NODE_ENV != 'production'

< (redis)=>
  proxy_get = (rtype, func)=>
    f = redis[rtype].bind(redis, func)
    (keys...)=>
      redis[func] = (args...)=>
        f(
          keys
          args.map(
            (i)=>
              if (
                i.constructor == String
              ) or (
                i instanceof Buffer
              ) or (
                i instanceof Uint8Array
              )
                return i
              i.toString()
          )
        )

  if DEBUG
    _proxy_get = proxy_get

    proxy_get = (rtype, func)=>
      if func of redis
        throw new Error("redis.#{func} exist")
      _proxy_get rtype, func

  dot (rtype)=>
    dot (func)=>
      proxy_get(rtype, func)
