#!/usr/bin/env coffee

> msgpackr > pack
  ./redis.js

< (stream)=>
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

