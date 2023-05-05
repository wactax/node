> lru-cache > LRUCache

< (max=1e5)=>
  cache = new LRUCache {max}
  (func)=>
    (key)=>
      r = cache.get(key)
      if r
        return r
      r = await func(key)
      cache.set key, r
      return r
