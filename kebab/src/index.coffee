split = '-'
export default (s)=>
  if s.length

    s0 = s[0]
    begin = s0.toLowerCase()
    t = [begin]
    pre_is_upper = begin != s0

    for i in s[1..]
      l = i.toLowerCase()
      if l != i
        if pre_is_upper
          t.push l
        else
          if t[t.length-1]!=split
            t.push split
          t.push l
          pre_is_upper = true
      else if i == '_'
        t.push split
      else
        t.push i
        pre_is_upper = false
    t.join('')
  else
    s
