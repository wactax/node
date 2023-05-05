export ONEXIT = new Set

< (func)=>
  ONEXIT.add(func)
  return

run = =>
  Promise.allSettled [...ONEXIT].map((f)=>f())


uncaughtException = 'uncaughtException'
process.on uncaughtException, (e) =>
  console.error(uncaughtException)
  console.error(e)
  await run()
  process.exit(99)
  return

# ctrl+c = SIGINT
['exit', 'SIGINT', 'SIGUSR1', 'SIGUSR2', 'SIGTERM'].forEach (type)=>
  process.on type, (e)=>
    await run()
    process.exit()
  return
