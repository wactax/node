#!/usr/bin/env coffee

> @w5/redistream
  @w5/redistream/Xadd
  @w5/redis

{REDIS_URI} = process.env
do =>
  if not REDIS_URI
    console.log 'miss REDIS_URI'
    return
  R = redis(REDIS_URI)
  xadd = Xadd(R).test
  await xadd('a','b'+new Date())
  console.log await R.xinfo('stream','test')

  # await redistream(R).test (i)=>
  #   console.log '>',i
  #   return

  console.log 'clear', await R.del 'test'
  console.log 'keys', await R.keys '*'
  process.exit()
  return
