> @w5/xedis > conn Server
  @w5/onexit

host_port = (s)=>
  s = s.split(':')
  if s.length == 1
    s.push 6379
  else
    s[1] = +s[1]
  s

< (env=process.env)=>
  {
    REDIS_HOST_PORT
    REDIS_PASSWORD
    REDIS_USER
    REDIS_DB
  } = env

  if not REDIS_HOST_PORT
    throw new Error "no redis connect env : REDIS_HOST_PORT"
    return

  li = REDIS_HOST_PORT.split(' ')
  if li.length == 1
    li = host_port li[0]
  else
    li = li.map host_port

  server = if Array.isArray li[0] then Server.cluster(li) else Server.hostPort(...li)
  # new Redis('redis://'+uri)
  redis = await conn(
    server
    REDIS_USER or 'default'
    REDIS_PASSWORD or ''
    +REDIS_DB or 0
  )

  onexit =>
    redis.quit()

  redis
