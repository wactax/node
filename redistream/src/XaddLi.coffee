#!/usr/bin/env coffee

> @w5/dot

< (redis)=>
  dot (stream)=>
    (id,li)=>
      redis.xadd(
        stream
        args.map(
          (item)=>
            item.map(
              (k,v)=>
                [
                  k.toString()
                  JSON.stringify v
                ]
            )
        )
      )

