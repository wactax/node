export ONEXIT = new Set

< (func)=>
  ONEXIT.add(func)
  return


run = =>
  await Promise.allSettled [...ONEXIT].map(
    (f)=>
      try
        await f()
      catch err
        console.trace err
      finally
        ONEXIT.delete f
      return
  )
  return


uncaughtException = 'uncaughtException'
process.on uncaughtException, (e) =>
  console.error(uncaughtException)
  console.trace(e)
  await run()
  process.exit(255)
  return

['exit', 'SIGINT', 'SIGUSR1', 'SIGUSR2', 'SIGTERM'].forEach (type)=>
  process.on type, (e)=>
    await run()
    process.exit()
  return

#process.on 'beforeExit', run
