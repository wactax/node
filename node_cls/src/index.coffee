bind = (i,init,li)=>
  (args...)=>
    t = await init(...args)
    r = {}
    for [i,f] from li
      r[i] = f.bind(r,t)
    r

< (o)=>
  li =  Object.entries o
  cls = []
  for [k,v] from li
    if k.endsWith 'New'
      cls.push [
        k[..-4],[]
      ]

  r = {}

  `$: //`
  for [k,v] from li
    for i from cls
      p = i[0]
      if k.startsWith p
        k = k[p.length..]
        if k == 'New'
          `continue $`
        k = k[0].toLowerCase() + k[1..]
        i[1].push [k,v]
        `continue $`
    r[k] = v

  for [i,li] from cls
    r[i[0].toUpperCase()+i[1..]] = bind(
      i
      o[i+'New']
      li
    )

  r

