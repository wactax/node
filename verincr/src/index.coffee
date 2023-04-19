< (s)=>
  s = s.split('.').map((i)=>parseInt(i))
  {length} = s
  s[length-1]+=1
  r = []
  loop
    {length} = s
    if --length
      n = s.pop()
      if n > 99
        s[length-1] = 1+s[length-1]
        r.unshift 0
      else
        r.unshift n
        break
    else
      break
  (s.concat r).join('.')
