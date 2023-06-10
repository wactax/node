#!/usr/bin/env coffee

> @w5/pg/PG > LI0 Q ITER

sleep = (n)=>
  new Promise (resolve)=>
    setTimeout(
      resolve
      n
    )
    return

await sleep 2000

# console.log await LI0"select schema_name from information_schema.schemata WHERE schema_name NOT IN ('information_schema', 'pg_catalog')"
n = 0
for await i from ITER('bot.adult','hw,baidu')
  console.log ++n,i

await sleep 2000

console.log 'done'
process.exit()
