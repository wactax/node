> os > hostname cpus
  @w5/pool > Pool
  @w5/dot
  @w5/utf8/utf8d

POOL_N = cpus().length*2
POOL = Pool POOL_N
GROUP = 'C'
CUSTOMER = hostname()

< (redis)=>
  wrap = (id, func, msg)=>
    try
      r = await func(...msg)
    catch err
      console.error err, func, msg
      return
    return

  dot (stream)=>
    (func, block=3e5)=>
      now = +new Date()
      stop = Math.max(
        now + 864e5 - block*12
        now + 18e6
      )
      limit = POOL_N
      loop
        console.log {limit}
        task_li = await redis.xnext(
          GROUP
          CUSTOMER
          Math.max(Math.round(limit),1)
          block
          false # noack
          stream
        )
        begin = +new Date()
        for [
          _ # stream_name
          li
        ] from task_li
          for [id, msg] from li
            msg = msg.map (k,v)=>
              [utf8d(k),utf8d(v)]
            await POOL wrap, id, func, msg
        await POOL.done
        if +new Date() > stop
          return
        cost = new Date() - begin
        console.log {block, cost}
        limit = ((block/cost) + (limit*7))/8
      return


# xreadgroup = (redis, stream, group, consumer, count, timeout)=>
#   n = 2
#   while n--
#     try
#       return (
#         await redis.xreadgroup(
#           'GROUP'
#           group, consumer
#           'COUNT', count
#           'BLOCK', timeout
#           'STREAMS', stream
#           '>'
#         )
#       ) or []
#     catch err
#       {message} = err
#       console.warn 'WARN: ', message, '→ AUTO CREATE'
#       if message.startsWith 'NOGROUP '
#         await redis.xgroup('CREATE', stream, group, 0, 'MKSTREAM')
#         continue
#       throw err
#   return []
#
# run = (redis, stream, group, pool, xdel, func, i)=>
#   pool =>
#     func(...i[1])?
#       # TODO 添加 .catch 并记录错误次数和错误
#       .finally =>
#         [id] = i
#         pipe = redis.pipeline()
#         pipe.xack stream, group, id
#         pipe.xdel stream, id
#         p = do =>
#           await pipe.exec()
#           xdel.delete p
#           return
#         xdel.add p
#         return
#
# runLi = (redis, stream, group, pool, func, li)->
#   if li.length
#     xdel = new Set()
#     for i from li
#       await run(redis, stream, group, pool, xdel, func, i)
#     await Promise.allSettled xdel
#   return
#
# DAY = 864e5
#
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
