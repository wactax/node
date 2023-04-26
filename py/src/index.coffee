#!/usr/bin/env coffee

> node-calls-python

{interpreter:py} = NodeCallsPython

< (pyfp)=>
  cls = await py.import pyfp

  _get = (name)=>
    (args...)=>
      py.call(
        cls
        name
        ...args
      )

  get = => # nodejs 默认会检查 then
    get = _get
    return

  new Proxy(
    {}
    get:(_,name)=>
      get(name)
  )
