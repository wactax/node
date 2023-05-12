#!/usr/bin/env coffee

> @w5/redis/MQ
  @w5/redistream/init
  @w5/redistream/fail_table
  ./stream

await init MQ
await FailTable stream
process.exit()
