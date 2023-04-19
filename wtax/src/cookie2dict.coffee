> ./split.js

< (cookie)=>
  r = {}
  if cookie
    cookie = cookie.split(';')
    for i from cookie
      [k,v] = split i,'='
      r[k.trimStart()]=v
  r


