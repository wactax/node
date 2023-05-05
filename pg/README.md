[‼️]: ✏️README.mdt

# @w5/pg

[test/main.coffee](./test/main.coffee) :

```coffee
#!/usr/bin/env coffee

> @w5/pg/PG > LI0 Q

sleep = (n)=>
  new Promise (resolve)=>
    setTimeout(
      resolve
      n
    )
    return

await sleep 2000

console.log await LI0"select schema_name from information_schema.schemata WHERE schema_name NOT IN ('information_schema', 'pg_catalog')"

await sleep 2000

console.log 'done'
```

output :

```
[
  [ 16390, 'i8' ],
  [ 16402, 'u8' ],
  [ 16414, 'u16' ],
  [ 16426, 'u32' ],
  [ 16438, 'u64' ]
]
0.034s select schema_name from information_schema.schemata WHERE schema_name NOT IN ('information_schema', 'pg_catalog')
[ 'public', 'bot', 'img', 'auth_mail', 'u', 'pg_toast' ]
```
