
< (redis, key, duration=6e4)=>
  new Proxy(
    {}
    get:(_, name)=>
      + cache
      =>
        if cache
          id = cache[0]
          max = cache[1]
          if id == max
            [step,time] = cache[2..]
            now = + new Date
            diff = now - time
            if diff > duration
              if step > 1
                --step
            else
              step += Math.round(
                duration / Math.max(diff,1e3)
              )

            max = await redis.hincrby(key, name, step)
            id = max - step + 1
            cache = [id,max,step,now]
        else
          step = 1
          max = await redis.hincrby(key, name, step)
          id = max - step
          cache = [id,max,step,+new Date]
        return ++cache[0]
  )

