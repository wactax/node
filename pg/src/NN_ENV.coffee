#!/usr/bin/env coffee

{env} = process

export default [
  env.NN_URI
  +env.NN_POOL_CONN or 1
]

export UINT = [
  [20,"bigint"]
]
