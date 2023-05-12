#!/usr/bin/env coffee

> msgpackr > pack

< (redis, stream)=>
  (li)=>
    redis.xaddLi(
      stream
      li.map(
        (t)=>
          [
            [
              pack t[0]
              pack t.slice(1)
            ]
          ]
      )
    )

