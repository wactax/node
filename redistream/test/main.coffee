#!/usr/bin/env coffee

> @w5/redistream
  @w5/redis

do =>
  R = await redis()
  ###
  await redistream(R).streamTest(
    (id, msg)=> # run
      console.log '>', id, msg
      return true
    (id, msg)=>
      console.log id, msg, 'failed'
      return
    1e4 # block time
  )
  console.log 'process.exit'
  ###
  process.exit()
  return
