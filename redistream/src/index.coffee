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

runLi = (redis, group, stream, li)->
  if li.length
    xdel = []
    for i from li
      yield i
      [id] = i
      p = redis.pipeline()
      p.xack stream, group, id
      p.xdel stream, id
      xdel.push p.exec()
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
      (timeout=6e5)->
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
              yield from runLi redis, group, stream, li
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
          yield from await runLi redis, group, stream, li
          if Math.random() < (timeout/DAY)
            await rmUnused(stream, group)
        return
  )
