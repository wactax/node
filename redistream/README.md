[‼️]: ✏️README.mdt

# @w5/redistream

# redis stream 用法

[Redis stream 教程](https://verytools.net/xtools-guide/posts/redis-stream)
[Redis 中文文档](http://www.redis.cn/commands/xreadgroup.html)

1. 创建流和消费组

```
stream_name = 'img'
group_name = 'get'
# 0 表示从头开始读取
await redis.xgroup('create', stream_name, group_name, 0, 'MKSTREAM')
```

2. 每个消费者批量认领任务（redis 会确保一个消费者只认领一个任务）

```
> os > hostname

BLOCK_TIMEOUT = 10 * 60 * 1000 # 10分钟超时

consumer = hostname()

for [_, li] from ( # _ 是 stream name
  await redis.xreadgroup(
    'GROUP', group_name
    consumer
    'COUNT', limit,
    'BLOCK', block_timeout
    'STREAMS',stream_name
    '>'
  ) or []
)
  for [id, msg] from li
    try
      await func(id,msg)
    finnaly
      await redis.xdel stream_name, id
```

3. 处理长期未 ACK 的 pending（被 xdel 的也会在这个阶段删除）

```
loop
  [
    _
    li
  ] = await redis.xautoclaim(stream_name, GROUP_NAME, consumer, 1000, '0-0')
  if not li.length
    break
  for [id, msg] from li
    try
      await func(id,msg)
    finnaly
      await redis.xdel stream_name, id
```

4. 每天清理长期未工作的消费者

```
for [_,name,_,pending,_,idle] from await redis.xinfo('CONSUMERS', stream_name, GROUP_NAME)
  if pending == 0 and idle > 86400000
    await redis.xgroup('DELCONSUMER',stream_name,GROUP_NAME,name)
```

[test/main.coffee](./test/main.coffee) :

```coffee
#!/usr/bin/env coffee

> @w5/redistream
  @w5/redis

do =>
  R = await redis()
  ###
  await redistream(R).streamTest(
    (id, msg)=> # run
      console.log '>', id, msg
      return true
    (id, msg)=>
      console.log id, msg, 'failed'
      return
    1e4 # block time
  )
  ###
  process.exit()
  return
```

output :

```
./out.txt
```
