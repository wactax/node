[‼️]: ✏️README.mdt

# @w5/redistream

[test/main.coffee](./test/main.coffee) :

```coffee
#!/usr/bin/env coffee

> @w5/redistream
  @w5/redistream/Xadd
  @w5/redis

{REDIS_URI} = process.env
do =>
  if not REDIS_URI
    console.log 'miss REDIS_URI'
    return
  R = redis(REDIS_URI)
  xadd = Xadd(R).test
  await xadd('a','b'+new Date())
  console.log await R.xinfo('stream','test')

  # for await i from redistream(R).test()
  #   console.log i

  console.log 'clear', await R.del 'test'
  console.log 'keys', await R.keys '*'
  process.exit()
  return
```

output :

```
miss REDIS_URI
```
