> os > hostname cpus
  @w5/pool > Pool
  @w5/dot
  msgpackr > unpack
  @w5/utf8/utf8d
  @w5/redis_lua/dot_bind

POOL_N = cpus().length*2
POOL = Pool POOL_N
GROUP = 'C'
CUSTOMER = hostname()

limit_round = (limit)=>
  Math.max(Math.round(limit),1)

< (redis)=>
  B = DotBind(redis)
  B.fbin.xpendclaim
  B.fcall.xconsumerclean

  dot (stream)=>
    xdel = redis.xdel.bind redis, stream
    xconsumerclean = redis.xconsumerclean.bind(
      redis
      stream
      GROUP
    )

    now = +new Date()
    stop = now + 83e6
    stop = 0

    runed = 0
    cost = 0

    wrap = (task_id, func, id, msg)=>
      begin = + new Date()
      try
        r = await func(id,msg)
      catch err
        console.error err, func, msg
        return

      ++ runed
      cost += (new Date - begin)

      if r == true
        POOL xdel, task_id
      return


    (
      func
      fail = =>
      block=3e5
      max_retry = 6
    )=>
      idle = block * 3
      limit = POOL_N

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
          if retry > max_retry
            try
              await fail(id, msg)
            catch err
              console.error fail, err, id, msg
            POOL xdel, task_id
          else
            await POOL wrap, task_id, func, id, msg
          console.log task_id, retry, id, msg
        return

      loop
        console.log 'limit', Math.round limit
        task_li = await redis.xnext(
          GROUP
          CUSTOMER
          limit_round limit
          block
          false # noack
          stream
        )
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
          POOL.done?.then =>
            if runed
              limit = (
                (
                  block / (Math.max(cost,1)/runed)
                ) + limit*63
              )/64
              if runed > 1e3
                runed = Math.round runed/2
                cost = cost/2
            return

        await xpendclaim()
        diff = stop - new Date
        if diff < 0
          await POOL.done
          break
        console.log 'remain ', Math.round(diff/36000)/100 + 'h'
      await xconsumerclean(864e6)
      return

