#!/usr/bin/env coffee

> @w5/redis
  @w5/redistream/init

R = await redis()
await init R
