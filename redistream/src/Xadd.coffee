#!/usr/bin/env coffee

> msgpackr > pack
  ./redis.js

< new Proxy(
    {}
    get:(_, stream)=>
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
  )
