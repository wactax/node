> @w5/time > Second

CACHE = new Map
MINUTE = 6e4

< new Proxy(
  {}
  get:(_, redis, key, name)=>
    =>
      cache = CACHE.get(name)
      if cache
        id = cache[0]
        max = cache[1]
        if id == max
          [step,time] = cache[2..]
          diff = new Date() - time
          if diff > MINUTE
            if step > 1
              -- step
          else
            step *= 2

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

