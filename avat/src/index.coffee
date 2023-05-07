> ava

export default (mod)=>
  new Proxy(
    {}
    get:(_,name)=>
      func = mod[name]
      (args...)=>
        (result)=>
          ava(
            name
            (t)=>
              r = func(...args)
              if r instanceof Promise
                name = 'await '+name
              console.log '`'+name+'(', args.map(
                (i)=>JSON.stringify i
              ).join(','), ')`', ' → `'+util.format(result)+'`\n'
              if r instanceof Promise
                r = await r
              t.deepEqual(
                r
                result
              )
              return
          )
  )
