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
  DotBind(redis).fbin.xpendclaim
  dot (stream)=>
    xdel = redis.xdel.bind redis, stream
    now = +new Date()
    stop = now + 83e6

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
          return
        console.log 'remain ', Math.round(diff/36000)/100 + 'h'
      return


# rmUnused = (redis, stream, group)=>
#   for [_,consumer,_,pending,_,idle] from await redis.xinfo('CONSUMERS', stream, group)
#     if pending == 0 and idle > DAY
#       await redis.xgroup('DELCONSUMER',stream,group,consumer)
#   return
#
# HOSTNAME = hostname()
#
# < (redis)=>
#   new Proxy(
#     {}
#     get:(_, stream)=>
#       group = 'I'
#       (func, conf={})=>
#         _loop = conf.loop or 100
#         timeout = conf.timeout or 3e5
#         pool_n = Math.max(
#           Math.round(conf.pool or cpus().length*1.5)
#           1
#         )
#         pool = Pool pool_n
#
#         count = pool_n
#         while _loop--
#           for [_, li] from await xreadgroup(
#             redis
#             stream
#             group
#             HOSTNAME
#             count
#             timeout
#           )
#             {length} = li
#             if length
#               begin = + new Date
#               await runLi redis, stream, group, pool, func, li
#               await pool.done
#               cost = Math.max((new Date) - begin, 1)
#               count = Math.max(
#                 Math.round((9*count + (length*timeout/cost))/10)
#                 pool_n
#               )
#               console.log 'redis → loop', _loop, 'stream', stream, 'group', group, 'consumer', HOSTNAME, 'run', length, 'items', Math.round(cost/length)/1000+'s/item next limit', count
#           [
#             _
#             li
#           ] = await redis.xautoclaim(
#             stream
#             group
#             HOSTNAME
#             timeout * 6
#             '0-0'
#           )
#           await runLi redis, stream, group, pool, func, li
#           if Math.random() < (timeout/DAY)
#             await rmUnused(redis, stream, group)
#         await pool.done
#         return
#   )
