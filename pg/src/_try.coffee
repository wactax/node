#!/usr/bin/env coffee

> chalk

DEBUG = process.env.NODE_ENV != 'production'

{red,redBright,greenBright,gray} = chalk

sql_escape = (i)=>
  if i instanceof Uint8Array
    return '\'\\x'+Buffer.from(i).toString('hex')+'\'::bytea'
  switch typeof i
    when 'string'
      return '\''+i.replaceAll('\'','\\\'')+'\''
  if i?.value
    return i.value
  if Array.isArray(i)
    r = []
    for j from i
      r.push sql_escape j
    return r.join('')
  if i?.first
    return i.first
  return JSON.stringify i

_sql = (args)=>
  li = []
  for i from args[1..]
    first = i?.first
    if first
      if not Array.isArray first
        first = [...Object.entries(first)]
      li = li.concat first.map sql_escape
    else
      li.push sql_escape i

  r = []

  sql = args[0]

  if Array.isArray sql
    for i,pos in sql
      r.push i
      r.push li[pos]
    return r.join ''

  return sql.replace(
    /(\$\d+)/g
    (x)=>
      return li[x[1..]-1]
  )


if DEBUG
  _try = (func)=>
    (args...)=>
      begin = new Date
      try
        r = await func.apply(func, args)
      catch err
        console.trace()
        console.error redBright err.message
        console.error red _sql args
        return []
      console.log gray(
        Math.round(new Date - begin)/1000+'s'
      ),greenBright _sql args
      r
else
  _try = (func)=>
    (args...)=>
      try
        return await func.apply(func, args)
      catch err
        console.trace()
        console.error redBright err.message
        console.error red _sql args
      return []

< default _try
