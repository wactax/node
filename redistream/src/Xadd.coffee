#!/usr/bin/env coffee

> @w5/dot

< (redis)=>
  dot (stream)=>
    (id,args...)=>
      redis.xadd(
        stream
        [
          [
            id.toString()
            JSON.stringify args
          ]
        ]
      )

