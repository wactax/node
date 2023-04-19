#!/usr/bin/env coffee

{env} = process

export default [
  env.PG_URI
  +env.PG_POOL_CONN or 16
]

export UINT = [
  [20,"bigint"]
]

