> lmdbx > open
  path > join
  fs > statSync existsSync readFileSync
  @w5/walk > walkRel
  @w5/xxhash3-wasm > hash128
  @w5/u8 > u8eq

< watchOnce = (dbfile,root,ignore,change,rm)=>
  db = await open {
    path: dbfile+'.mdbx'
    keyEncoding: 'string'
  }

  exist = new Set()

  for await rel from walkRel(root, ignore)
    fp = join root, rel
    exist.add rel
    {mtimeMs,size} = statSync(fp)
    mtimeMs = parseInt mtimeMs

    val = await db.get rel
    if val
      [_mtime,_size,_hash] = val
      if _mtime == mtimeMs and size == _size
        continue

    buf = readFileSync fp
    hash = hash128 buf
    if _hash
      if u8eq(hash,_hash)
        continue

    await db.put rel,[
      mtimeMs
      size
      hash128 buf
    ]
    await change(rel)

  for key from db.getKeys()
    if exist.has key
      exist.delete key
    else
      await db.remove key
      await rm key

  return

