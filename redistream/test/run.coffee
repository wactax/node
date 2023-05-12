#!/usr/bin/env coffee

> @w5/redistream
  @w5/redis/MQ
  ./stream

do =>
  await redistream(
    stream
    (id, msg)=> # run
      console.log '>', id, msg
      return # true
    3e3 # block time
  )
  console.log 'process.exit'
  process.exit()
  return
