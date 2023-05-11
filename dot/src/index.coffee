< (func)=>
  new Proxy(
    {}
    get:(_,name)=>
      func.bind(func, name)
  )
