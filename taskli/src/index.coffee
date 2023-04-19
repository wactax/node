> @w5/sleep
  @w5/bar:Bar

< (call)=>
  li = []

  + running

  run = =>
    running = true
    loop
      n = li.length
      if n == 0
        break
      bar = Bar n
      while n--
        args = li.shift()
        try
          r = await call ...args
          if r == false
            li.push args
          else
            bar()
        catch err
          console.error err
          li.push args
          await sleep 9000

    running = undefined
    return

  # add task
  (args...)=>
    li.push args
    if not running
      run()
    return
