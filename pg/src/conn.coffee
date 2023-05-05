#!/usr/bin/env coffee

> postgres
  @w5/onexit

< (uri, opt)=>
  pg = postgres(
    'postgres://'+uri
    {
      # idle_timeout: 60
      prepare: true
      ...opt
    }
  )
  onexit =>
    await pg.end({ timeout: 9 })
    new Promise (r)=>
      pg.close(r)
      return

  pg
