#!/usr/bin/env coffee

> @w5/dot

DEBUG = process.env.NODE_ENV != 'production'

< (redis)=>
  proxy_get = (rtype, func)=>
    f = redis[rtype].bind(redis, func)

    keys_args = (keys, args)=>
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

    (keys...)=>
      if keys.length
        redis[func] = (args...)=>
          keys_args(keys,args)
      else
        redis[func] = (keys...)=>
          (args...)=>
            keys_args(keys,args)

  if DEBUG
    _proxy_get = proxy_get

    proxy_get = (rtype, func)=>
      if func of redis
        throw new Error("redis.#{func} exist")
      _proxy_get rtype, func

  dot (rtype)=>
    dot (func)=>
      proxy_get(rtype, func)
