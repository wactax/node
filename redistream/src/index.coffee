> os > hostname cpus
  @w5/pool > Pool
  msgpackr > unpack pack
  @w5/redis_lua/dot_bind.js
  ./XPENDCLAIM.js
  ./on_fail.js
  ./redis.js

GROUP = 'C'
CUSTOMER = do =>
  name = hostname()
  p = name.lastIndexOf('.')
  if ~p
    name = name.slice(0,p)
  name

limit_round = (limit)=>
  Math.max(Math.round(limit),1)

B = DotBind(redis)
B.fbin.xpendclaim
B.fcall.xconsumerclean

export default (
  stream
  func
  task_pre_cpu=2
  block=3e5
  max_retry=6
)=>
  pool_n = Math.max(Math.round(cpus().length*task_pre_cpu),1)
  pool = Pool pool_n

  xdel = redis.xdel.bind redis, stream
  xconsumerclean = redis.xconsumerclean(
    stream
    GROUP
  )

  now = +new Date()
  stop = now + 83e6
  # stop = 0

  runed = 0
  cost = 0

  wrap = (task_id, func, id, msg)=>
    begin = + new Date()
    try
      r = await func(id,...msg)
    catch err
      console.error err, func, msg
      return

    ++ runed
    cost += (new Date - begin)

    if r == true
      pool xdel, task_id
    return

  fail = OnFail stream
  idle = block * 3
  limit = 2*pool_n

  xpendclaim = XPENDCLAIM(
    redis
    stream
    GROUP
    CUSTOMER
    idle
  )

  pendclaim = =>
    _limit = limit_round limit
    loop
      n = 0
      for await [
        retry, task_id, id, msg
      ] from xpendclaim _limit
        ++n
        if retry > max_retry
          try
            await fail(id, pack(msg))
          catch err
            console.error fail, err, id, msg
          pool xdel, task_id
        else
          await pool wrap, task_id, func, id, msg
      if _limit >= n
        break
    return

  loop
    console.log 'stream limit', Math.round limit
    task_li = await redis.xnext(
      GROUP
      CUSTOMER
      limit_round limit
      block
      false # noack
      stream
    )
    # console.log 'get task li'
    begin = +new Date()
    for [
      _ # stream_name
      li
    ] from task_li
      for [task_id, [kvli]] from li
        id = unpack(kvli[0])
        msg = unpack(kvli[1])
        await pool(
          wrap, task_id, func, id, msg
        )

    if task_li.length > 0
      limit = Math.max(
        (
          (
            block / (
              (1+Math.max(cost,1))/(1+runed)
            )
          ) + limit*7
        )/8
        1
      )
      if runed > 128
        runed /= 2
        cost /= 2

    # console.log 'xpendclaim'
    await pendclaim()
    # console.log 'xpendclaim done'
    diff = stop - new Date
    if diff < 0
      await pool.done
      break
    console.log 'stream will stop after', Math.round(diff/36000)/100 + 'h'
  await xconsumerclean(6048e5)
  return

