> ava
  util

export default (mod)=>
  new Proxy(
    {}
    get:(_,name)=>
      func = mod[name]
      (args...)=>
        (result)=>
          new Promise (resolve, reject)=>
            ava(
              name
              (t)=>
                try
                  r = func.apply(mod,args)
                  if r instanceof Promise
                    name = 'await '+name
                  console.log '`'+name+'(', args.map(
                    (i)=>
                      if i?.constructor == String
                        return JSON.stringify(i)
                      util.format i
                  ).join(','), ')`', '\n  → `'+util.format(result)+'`\n'
                  if r instanceof Promise
                    r = await r
                  t.deepEqual(
                    r
                    result
                  )
                  resolve(r)
                catch err
                  reject err
                return
            )
  )
