> os > hostname

xreadgroup = (redis, stream, group, consumer, count, timeout)=>
  n = 2
  while n--
    try
      return (
        await redis.xreadgroup(
          'GROUP'
          group, consumer
          'COUNT', count
          'BLOCK', timeout
          'STREAMS', stream
          '>'
        )
      ) or []
    catch err
      {message} = err
      console.warn 'WARN: ', message, '→ AUTO CREATE'
      if message.startsWith 'NOGROUP '
        await redis.xgroup('CREATE', stream, group, 0, 'MKSTREAM')
        continue
      throw err
  return []

run = (redis, xdel, func, i)=>
  func(i).finally =>
    [id] = i
    pipe = redis.pipeline()
    pipe.xack stream, group, id
    pipe.xdel stream, id
    p = do =>
      await pipe.exec()
      xdel.delete p
      return
    xdel.add p
    return

runLi = (redis, func, group, stream, li)->
  if li.length
    xdel = new Set()
    for i from li
      await run(redis, xdel, func, i)
    await Promise.allSettled xdel
  return

DAY = 864e5

rmUnused = (stream, group)=>
  for [_,consumer,_,pending,_,idle] from await redis.xinfo('CONSUMERS', stream, group)
    if pending == 0 and idle > DAY
      await redis.xgroup('DELCONSUMER',stream,group,consumer)
  return

HOSTNAME = hostname()

< (redis)=>
  new Proxy(
    {}
    get:(_, stream)=>
      group = 'I'
      (func, timeout=6e5)->
        count = 1
        loop
          console.log 'redis → ', stream, group, HOSTNAME, 'wait limit', count
          for [_, li] from await xreadgroup(
            redis
            stream
            group
            HOSTNAME
            count
            timeout
          )
            {length} = li
            if length
              begin = + new Date
              yield from runLi redis, func, group, stream, li
              cost = (new Date) - begin
              count = Math.max(
                Math.round((9*count + (length*timeout/cost))/10)
                1
              )
          [
            _
            li
          ] = await redis.xautoclaim(
            stream
            group
            HOSTNAME
            timeout * 3
            '0-0'
          )
          yield from await runLi redis, func, group, stream, li
          if Math.random() < (timeout/DAY)
            await rmUnused(stream, group)
        return
  )
