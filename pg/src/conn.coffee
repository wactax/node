#!/usr/bin/env coffee

> postgres
  @w5/onexit

CONN = new Set

onexit =>
  await Promise.allSettled(
    [...CONN].map (pg)=>
      pg.end({ timeout: 9 }).finally(
        =>
          CONN.delete pg
          return
      )
  )

< (uri, opt)=>
  pg = postgres(
    'postgres://'+uri
    {
      # idle_timeout: 60
      prepare: true
      ...opt
    }
  )
  CONN.add pg
  pg
