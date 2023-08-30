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

B = DotBind(redis)
B.fbin.xpendclaim()
B.fcall.xconsumerclean()
B.fcall.xackdel()

export default new Proxy(
  {}
  get:(_, stream)=>
    (
      func
      task_pre_cpu=2
      block=3e5
      max_retry=6
    )=>

      pool = Pool Math.max(
        Math.round(cpus().length*task_pre_cpu),1
      )
      limit = 1

      xdel = redis.xackdel stream, GROUP
      xconsumerclean = redis.xconsumerclean stream, GROUP

      pre_time = +new Date()
      stop = pre_time + 83e6
      # stop = 0

      runed = 0

      wrap = (task_id, func, id, msg)=>
        begin = + new Date()
        try
          r = await func(id,...msg)
          ++ runed
        catch err
          console.error err, func, msg
          return

        if r == true
          pool xdel, task_id
        return

      fail = OnFail stream
      idle = block * 3

      update_limit = =>
        if runed == 0
          return

        now = new Date
        cost = now - pre_time
        pre_time = now

        limit = Math.min(
          limit + 9
          Math.max(
            Math.round(
              block / (
                Math.max(cost,1)/runed
              )
            )
            1
          )
        )

        runed = 0
        return

      xpendclaim = XPENDCLAIM(
        redis
        stream
        GROUP
        CUSTOMER
        idle
      )

      pendclaim = =>
        loop
          n = 0
          for await [
            retry, task_id, id, msg
          ] from xpendclaim limit
            ++n
            if retry > max_retry
              try
                await fail(id, pack(msg))
              catch err
                console.error fail, err, id, msg
              pool xdel, task_id
            else
              await pool wrap, task_id, func, id, msg

          if n != 0
            update_limit()

          if limit > n
            break
        return

      loop
        console.log '⇨ stream limit', limit
        # console.log 'xpendclaim'
        # console.log 'xpendclaim done'
        task_li = await redis.xnext(
          GROUP
          CUSTOMER
          limit
          block
          false # noack
          stream
        )
        # console.log 'get task li'
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
          update_limit()

        await pendclaim()

        diff = stop - new Date
        console.log 'stream will stop after', Math.round(diff/36000)/100 + 'h'
        if diff < 0
          console.log 'stream stop'
          await pool.done
          break
      await xconsumerclean(6048e5)
      return
  )
