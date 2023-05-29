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
    return

  ing = []

  pyshell.on 'message',(msg)=>
    if msg.startsWith '<'
      r = +msg.slice(1)
      ing.pop() r
    else
      console.log 'PY>',msg
    return

  (args)=>
    p = new Promise (resolve)=>
      ing.unshift resolve
      return
    pyshell.send args
    p

