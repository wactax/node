#!/usr/bin/env coffee
> @w5/xedis > conn Server
  @w5/onexit

hostPort = (s)=>
  p = s.lastIndexOf(':')
  if not s.endsWith(']') and ~ p
    ip = s.slice(0, p)
    port = +s.slice(p+1)
  else
    ip = s
    port = 6379
  if ip.startsWith '['
    ip = ip.slice(1,-1)
  [ip, port]

# console.log hostPort '127.0.0.1:3223'
# console.log hostPort '[2a02:c207:2098:9386::1]:3223'
# console.log hostPort '[2a02:c207:2098:9386::1]'

< (env)=>
  {
    REDIS_HOST_PORT
    REDIS_PASSWORD
    REDIS_USER
    REDIS_DB
    REDIS_RESP
  } = env

  if not REDIS_HOST_PORT
    throw new Error "no redis connect env : REDIS_HOST_PORT"
    return

  li = REDIS_HOST_PORT.split(' ')
  if li.length == 1
    li = hostPort li[0]
  else
    li = li.map hostPort

  server = if Array.isArray li[0] then Server.cluster(li) else Server.hostPort(...li)
  # new Redis('redis://'+uri)
  redis = await conn(
    server
    REDIS_USER or ''
    REDIS_PASSWORD or ''
    +REDIS_DB or 0
    +REDIS_RESP or 3
  )

  onexit =>
    redis.quit()

  redis
