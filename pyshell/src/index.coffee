#!/usr/bin/env coffee

> python-shell > PythonShell

< (py)=>
  pyshell = new PythonShell(
    py
    pythonOptions:['-u']
    mode: 'text'
  )

  process.on 'exit',=>
    pyshell.kill(9)
    return

  pyshell.on 'pythonError', (err)=>
    console.error err
    ing.pop()[1] err
    return

  ing = []

  pyshell.on 'message',(msg)=>
    if msg.startsWith '<'
      ing.pop()[0] msg.slice(1)
    else
      console.log 'PY>',msg
    return

  (args)=>
    p = new Promise (resolve, reject)=>
      ing.unshift [resolve,reject]
      return
    pyshell.send args
    p

