#!/usr/bin/env coffee

> @w5/dot
  msgpackr > pack

< (redis)=>
  dot (stream)=>
    (id,args...)=>
      redis.xadd(
        stream
        [
          [
            pack id
            pack args
          ]
        ]
      )

