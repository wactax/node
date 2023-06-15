> @w5/utf8/utf8e.js

< u8eq = (first, second) =>
  first.length == second.length and first.every(
    (value, index) => value == second[index]
  )

< u8merge = (args...)=>
  n = 0
  for i, p in args
    if i.constructor == String
      args[p] = i = utf8e i
    n += i.length
  m = new Uint8Array(n)
  n = 0
  for i from args
    m.set(i, n)
    n += i.length
  m

< U8 = (args)=>
  new Uint8Array args
