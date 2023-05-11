#!/usr/bin/env coffee

> @w5/redistream
  @w5/redis

do =>
  R = await redis()

  await redistream(R).streamTest ([id, msg])=>
    console.log '>', id, msg
    return true
  process.exit()
  return
