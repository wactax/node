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

run = (func, [id, msg])=>
  try
    await func(id,...msg)
  catch err
    console.trace err
    console.error id, msg
  return

runLi = (redis, stream, func, li)=>
  if li.length
    xdel = []
    for i from li
      await run(func, i)
      xdel.push redis.xdel stream, i[0]
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
      (func, timeout=6e5)=>
        count = 10
        loop
          console.log stream, group, HOSTNAME, 'wait limit', count
          for [_, li] from await xreadgroup(
            redis
            stream
            group
            HOSTNAME
            count
            timeout
          )
            {length} = li
            console.log 'get li length',length
            if length
              begin = + new Date
              await runLi redis, stream, func, li
              cost = (new Date) - begin
              count = Math.max(
                Math.round( length * timeout / cost )
                1
              )
          [
            _
            li
          ] = await redis.xautoclaim(
            stream, group, HOSTNAME, timeout*3, '0-0'
          )
          await runLi redis, stream, func, li
          if Math.random() < (timeout/DAY)
            await rmUnused(stream, group)
        return
  )
