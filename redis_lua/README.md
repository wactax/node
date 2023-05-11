[‼️]: ✏️README.mdt

# @w5/redis_lua

[test/main.coffee](./test/main.coffee) :

```coffee
#!/usr/bin/env coffee

> @w5/uridir
  @w5/read
  path > join
  @w5/redis_lua

ROOT = uridir(import.meta)
LUA = read join ROOT,'redis.lua'

redis = {
  fbinR:=>
    new Uint8Array([])
  fnload:(lua)=>
    console.log lua
    return
}
await RedisLua(redis).RedisLuaTest LUA
```

output :

```
123
```
