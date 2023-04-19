> ./merge.js
  path > basename
  fs > existsSync readFileSync
  @w5/write
  @w5/binmap > BinMap
  @w5/u8 > u8eq
  @w5/blake3 > blake3Hash
  @w5/utf8/utf8e.js
  ./pick.js

export default (
  md
  to_md
  cache_fp
)=>
  if not existsSync cache_fp
    return

  md = pick ...merge(md)
  to_md = pick ...merge(to_md)

  if not to_md.length == md.length
    console.warn "length not match", cache_fp
    return

  cache = BinMap.load readFileSync cache_fp
  n = 0
  for mv,i in md
    hash = blake3Hash utf8e mv
    if cache.get(hash)
      to_v = to_md[i]
      v = utf8e to_v
      pre = cache.get hash
      if pre
        if not u8eq pre, v
          ++n
          console.log cache_fp+':\n'+mv+'\n→\n'+to_v
          cache.set hash, v
  if n
    write cache_fp, cache.dump()
  return
