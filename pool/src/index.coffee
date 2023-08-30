> os > cpus

< Pool = (max=cpus().length*2)=>
  ing = new Set
  todo = []

  + done, all_done
  _init_done = =>
    done = new Promise (resolve)=>
      all_done = resolve
      return
    return

  f = ->
    r = new Promise (resolve)=>
      todo.push [resolve,...arguments]
      return

    if ing.size < max # 不到 max 不阻塞
      if ing.size == 0
        _init_done()

      p = do =>
        while todo.length
          [resolve,func,args...] = todo.shift()
          try
            await func(...args)
          catch err
            console.error func, args, err
          finally
            resolve()

        return
      ing.add p
      p.finally =>
        ing.delete p
        if ing.size == 0
          all_done()
        return
      return

    return r

  Object.defineProperty(
    f
    'done'
    writeable:false
    get:=>
      if ing.size == 0
        return
      done
  )
  f
