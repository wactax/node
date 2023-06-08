
< (redis, key, duration=6e4)=>
  CACHE = new Map
  new Proxy(
    {}
    get:(_, name)=>
      =>
        cache = CACHE.get(name)
        if cache
          id = cache[0]
          max = cache[1]
          if id == max
            [step,time] = cache[2..]
            diff = new Date() - time
            if diff > duration
              if step > 1
                --step
            else
              if diff < 1e3
                step += 60
              else
                ++step

            max = await redis.hincrby(key, name, step)
            id = max - step
            CACHE.set name, [id,max,step,time]
        else
          step = 1
          max = await redis.hincrby(key, name, step)
          id = max - step
          cache = [id,max,step,+new Date]
          CACHE.set(name, cache)
        return ++cache[0]
  )

