#!/usr/bin/env coffee

> ./distDb.js > dbExist
  ./env.js > DIST
  @w5/ossput:put > reload:ossputReload
  @w5/cf
  @w5/pool > Pool
  @w5/walk > walkRel
  @w5/blake3/stream.mjs
  path > join
  fs > createReadStream
  @w5/mime

export default =>
  {
    SITE
    CLOUDFLARE_KEY
    SITE_OSSPUT_BUCKET
  } = process.env
  if not SITE_OSSPUT_BUCKET
    return

  ossputReload('SITE_')

  SITE_URL = 'https://'+SITE+'/'

  to_add = []
  files = []

  pool = Pool 30

  upload = (fp)=>
    full_fp = join DIST,fp
    add = await dbExist fp, await stream createReadStream full_fp
    if add
      await pool(
        put
        fp
        =>
          createReadStream(full_fp)
        mime(full_fp)
      )
      if fp == 'index.htm'
        fp = ''
      files.push SITE_URL+fp
      to_add.push add
    return

  for await fp from walkRel DIST
    await upload fp

  await pool.done

  if files.length and CLOUDFLARE_KEY
    [{id}] = await cf.GET('?name='+SITE)
    await cf.POST id+'/purge_cache', {files}
    for add from to_add
      await add()
  return
