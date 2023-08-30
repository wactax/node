> os > cpus

< Pool = (max=cpus().length*2)=>
  ing = 0
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

    if ing < max # 不到 max 不阻塞
      if ing == 0
        _init_done()
      ++ing

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
      p.finally =>
        --ing
        if ing == 0
          all_done()
        return
      return

    return r

  Object.defineProperty(
    f
    'size'
    writeable:false
    get:=>
      max
    set:(val)=>
      max = Math.max(1, val)
      return
  )

  Object.defineProperty(
    f
    'done'
    writeable:false
    get:=>
      if ing == 0
        return
      done
  )
  f
