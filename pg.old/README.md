[‼️]: ✏️README.mdt

# @w5/pg

[test/main.coffee](./test/main.coffee) :

```coffee
#!/usr/bin/env coffee

> @w5/pg

Q = await pg process.env.PG_URI

console.log await Q.browser.get(1)

process.exit()
```

output :

```
[ '1', 'Chrome', '1080000' ]
```
