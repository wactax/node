#!/usr/bin/env coffee

> @w5/dot

< (redis)=>
  dot (stream)=>
    (li)=>
      redis.xaddLi(
        stream
        li.map(
          (t)=>
            [
              [
                t[0].toString()
                JSON.stringify(t.slice(1))
              ]
            ]
        )
      )

