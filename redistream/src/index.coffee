> os > hostname cpus
  @w5/pool > Pool
  msgpackr > unpack pack
  @w5/redis_lua/dot_bind.js
  ./on_fail.js
  ./redis.js

POOL_N = Math.max(Math.round(cpus().length*1.9),1)
POOL = Pool POOL_N
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
  block=3e5
  max_retry=6
)=>
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
      POOL xdel, task_id
    return

  fail = OnFail stream
  idle = block * 3
  limit = 2*POOL_N

  xpendclaim = =>
    li = await redis.xpendclaim(
      stream # stream
      GROUP # group
      CUSTOMER
    )(
      idle    # idle
      limit_round limit
    )

    if not li
      return

    for [task_id, retry, id, msg] from unpack li
      # console.log {task_id, retry, id, msg}
      if retry > max_retry
        try
          await fail(id, pack(msg))
        catch err
          console.error fail, err, id, msg
        POOL xdel, task_id
      else
        await POOL wrap, task_id, func, id, msg
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
        await POOL(
          wrap, task_id, func, id, msg
        )

    if task_li.length > 0
      limit = (
        (
          block / (
            (1+Math.max(cost,1))/(1+runed)
          )
        ) + limit*63
      )/64
      if runed > limit
        runed = Math.round runed/2
        cost = cost/2

    # console.log 'xpendclaim'
    await xpendclaim()
    # console.log 'xpendclaim done'
    diff = stop - new Date
    if diff < 0
      await POOL.done
      break
    console.log 'stream will stop after', Math.round(diff/36000)/100 + 'h'
  await xconsumerclean(6048e5)
  return

