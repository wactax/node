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

  # await redistream(R).test (i)=>
  #   console.log '>',i
  #   return

  console.log 'clear', await R.del 'test'
  console.log 'keys', await R.keys '*'
  process.exit()
  return
```

output :

```
[
  'length',
  4,
  'radix-tree-keys',
  1,
  'radix-tree-nodes',
  2,
  'last-generated-id',
  '1681975889352-0',
  'max-deleted-entry-id',
  '0-0',
  'entries-added',
  4,
  'recorded-first-entry-id',
  '1681975720354-0',
  'groups',
  1,
  'first-entry',
  [
    '1681975720354-0',
    [ 'a', 'bThu Apr 20 2023 15:28:39 GMT+0800 (中国标准时间)' ]
  ],
  'last-entry',
  [
    '1681975889352-0',
    [ 'a', 'bThu Apr 20 2023 15:31:28 GMT+0800 (中国标准时间)' ]
  ]
]
clear 1
keys []
```
