#!/usr/bin/env coffee

> @w5/redistream
  @w5/redis

do =>
  R = await redis()

  await redistream(R).streamTest (args...)=>
    console.log {args}
    return
  process.exit()
  return
