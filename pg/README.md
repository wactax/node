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
process.exit()
```

output :

```
0.034s select schema_name from information_schema.schemata WHERE schema_name NOT IN ('information_schema', 'pg_catalog')
[
  'public', 'auth_mail',
  'u',      'img',
  'bot',    'mq_fail',
  'cron',   'pg_toast'
]
done
```
