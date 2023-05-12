#!/usr/bin/env coffee

> @w5/redistream
  @w5/redistream/init
  @w5/redistream/XaddLi
  @w5/redistream/Xadd
  @w5/redis

do =>
  R = await redis()
  await init R
  return
  xadd = Xadd(R).streamTest
  xaddLi = XaddLi(R).streamTest
  await xadd(1, 'a','b','c')
  await xaddLi [
    [2, 'a2','b2','c2']
    [3, 'a3','b3','c3']
  ]
  # xadd = Xadd(R).test
  # await xadd('a','b'+new Date())
  # console.log await R.xinfo('stream','test')
  #
  # # await redistream(R).test (i)=>
  # #   console.log '>',i
  # #   return
  #
  # console.log 'clear', await R.del 'test'
  # console.log 'keys', await R.keys '*'
  console.log 'done'
  process.exit()
  return
