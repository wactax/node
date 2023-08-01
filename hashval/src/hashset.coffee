> ./index.js:hashval

< (val)=>
  val = val.trim()
  same = val == hashval
  if not same
    location.hash = val
  same
