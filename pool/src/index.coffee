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
    todo.push [...arguments]

    if ing.size < max
      if ing.size == 0
        _init_done()

      p = new Promise (resolve)=>
        while todo.length
          [func,args...] = todo.shift()
          try
            await func(...args)
          catch err
            console.error func, args, err

        ing.delete(p)
        if ing.size == 0
          all_done()

        return

      ing.add p
    return
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
