SPLIT = new Set '(),>'

< (prompt, gen)=>
  if not prompt
    return ''

  r = []
  t = []

  push = =>
    if t.length
      s = t.join('')
      len = s.length
      s = s.trimStart()
      slen = s.length
      space_begin = len - slen
      s = s.trimEnd()
      space_end = slen - s.length
      r.push ''.padEnd(space_begin)+gen(s)+''.padEnd(space_end)
    t = []
    return

  for i,p in prompt
    if SPLIT.has i
      is_lora = i == '>'
      if is_lora
        t.push i
      push()
      if not is_lora
        r.push i
      if i == ','
        n = prompt[p+1]
        if n and n!=' '
          r.push ' '
    else
      t.push i

  push()

  r.join('')
