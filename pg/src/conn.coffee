#!/usr/bin/env coffee

> postgres
#   prexit
#
# CONN = new Set()
# prexit =>
#   li = []
#   for pg from CONN
#     li.push new Promise (r) =>
#       pg.close(r)
#       return
#     pg.end({ timeout: 9 })
#
#   await Promise.allSettled li
#   return

< (uri, opt)=>
  pg = postgres(
    'postgres://'+uri
    {
      # idle_timeout: 60
      prepare: true
      ...opt
    }
  )

  # CONN.add pg
  pg
