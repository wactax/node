#!/usr/bin/env coffee

> # @w5/redis/R
  @w5/redis/KV

console.log KV

# console.log R

await KV.sadd("test","b")
await KV.sadd("test",["c",'d'])
# console.log await KV.get("test")
console.log await KV.del("test")
console.log 'done'
process.exit()
