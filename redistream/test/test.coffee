#!/usr/bin/env coffee

> @w5/redis/MQ
  @w5/redis_lua/dot_bind.js

B = DotBind(MQ)
B.fbin.xpendclaim

stream = 'civitai_img'

li = await MQ.xpendclaim(
  stream # stream
  'C' # group
  'test' # 消费者
)(
  1e3
  2
)
console.log li
