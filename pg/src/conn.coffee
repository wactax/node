#!/usr/bin/env coffee

> postgres
  @w5/onexit

CONN = new Set

onexit =>
  await Promise.allSettled(
    [...CONN].map (pg)=>
      await pg.end({ timeout: 9 }).finally(
        =>
          CONN.delete pg
          return
      )
      new Promise (r)=>
        pg.close(r)
        return
  )

< (uri, opt)=>
  pg = postgres(
    'postgres://'+uri
    {
      idle_timeout: 30
      prepare: true
      ...opt
    }
  )
  CONN.add pg
  pg
