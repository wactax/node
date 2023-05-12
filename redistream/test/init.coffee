#!/usr/bin/env coffee

> @w5/redis/MQ
  @w5/redistream/init
  ./stream

await init MQ, stream
process.exit()
