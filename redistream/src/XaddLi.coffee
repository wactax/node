#!/usr/bin/env coffee

> @w5/dot
  msgpackr > pack

< (redis)=>
  dot (stream)=>
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

