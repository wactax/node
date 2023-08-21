[‼️]: ✏️README.mdt

# @w5/pg

[test/main.coffee](./test/main.coffee) :

```coffee
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
for await i from ITER.bot.adult('hw,baidu',2)
  console.log ++n,i
  if n > 3
    break
await sleep 2000

console.log 'done'
process.exit()
```

output :

```
0.056s SELECT id,hw,baidu FROM bot.adult WHERE id>0 ORDER BY id LIMIT 10000
1 [ 2, 0, 0 ]
2 [ 5, 0, 0 ]
3 [ 6, 0, 0 ]
4 [ 9, 0, 0 ]
done
```
