< (li)=>
  len = li.length
  if len > 1
    exist = new Set
    n = 0
    while n < len
      e = li[n]
      if exist.has(e)
        li.splice(n,1)
        --len
      else
        exist.add e
        ++n
  li
