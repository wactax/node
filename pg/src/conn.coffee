#!/usr/bin/env coffee

> postgres
  prexit

< (uri, opt)=>
  pg = postgres(
    'postgres://'+uri
    {
      # idle_timeout: 60
      prepare: true
      ...opt
    }
  )

  prexit =>
    await pg.end({ timeout: 9 })
    return

  pg
