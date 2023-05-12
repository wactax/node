#!/usr/bin/env coffee

> msgpackr > pack

< (redis, stream)=>
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

