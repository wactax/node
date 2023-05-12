#!/usr/bin/env coffee

> @w5/redistream
  @w5/redistream/init
  @w5/redistream/XaddLi
  @w5/redistream/Xadd
  ./stream

do =>
  xadd = Xadd stream
  xaddLi = XaddLi stream
  await xadd(1, 'a','b','c')
  await xaddLi [
    [2, 'a2','b2','c2']
    [3, 'a3','b3','c3']
  ]
  # xadd = Xadd(MQ).test
  # await xadd('a','b'+new Date())
  # console.log await MQ.xinfo('stream','test')
  #
  # # await redistream(MQ).test (i)=>
  # #   console.log '>',i
  # #   return
  #
  # console.log 'clear', await MQ.del 'test'
  # console.log 'keys', await MQ.keys '*'
  console.log 'done'
  process.exit()
  return
