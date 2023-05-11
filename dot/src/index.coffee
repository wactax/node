< (func)=>
  new Proxy(
    {}
    get:(_,name)=>
      func(name)
  )
