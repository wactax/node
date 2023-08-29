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
      pool_n = Math.max(
        Math.round(cpus().length*task_pre_cpu),1
      )
      pool = Pool pool_n

      xdel = redis.xackdel stream, GROUP
      xconsumerclean = redis.xconsumerclean stream, GROUP

      now = +new Date()
      stop = now + 83e6
      # stop = 0

      runed = 0
      cost = 0

      wrap = (task_id, func, id, msg)=>
        begin = + new Date()
        try
          r = await func(id,...msg)
          ++ runed
          cost += (new Date - begin)
        catch err
          console.error err, func, msg
          return


        if r == true
          pool xdel, task_id
        return

      fail = OnFail stream
      idle = block * 3
      limit = 2*pool_n

      update_limit = =>
        if runed == 0
          return

        n = block / (
          Math.max(cost,1)/runed
        )
        if n > limit
          if n > 9
            limit = Math.round(
              (limit*8+n)/9
            )
          else
            ++limit
        else if limit > 1
          limit = Math.round limit/2

        if runed > 128
          runed /= 2
          cost /= 2
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
        console.log 'stream limit', Math.round limit
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
