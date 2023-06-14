SPLIT = new Set '()<>:,'

< (prompt)=>

  r = []
  t = []
  for i,p in prompt
    if SPLIT.has i
      if t.length
        r.push t.join('')
        t = []
      r.push i
    else
      t.push i

  r.join('')
