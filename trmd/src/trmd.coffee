#!/usr/bin/env coffee

> ./merge.js
  fs > existsSync readFileSync
  assert > strict:assert
  @w5/htm2md
  @w5/md2htm
  @w5/write
  @w5/tran > tranHtml
  @w5/binmap > BinMap:_BinMap
  @w5/blake3 > blake3Hash
  @w5/utf8/utf8e.js
  @w5/utf8/utf8d.js
  ./pick.js

BinMap = (cache_path)=>
  if existsSync cache_path
    _BinMap.load readFileSync cache_path
  else
   new _BinMap

usedCache = (cache_path, md, pos_li)=>
  cache = BinMap cache_path
  new_cache = new _BinMap
  pli = []
  hash_li = []
  for i from pos_li
    line = md[i]
    hash = blake3Hash utf8e line
    hash_li.push hash
    pre = cache.get hash
    if pre
      new_cache.set hash, pre
      md[i] = utf8d pre
    else
      pli.push i
  [
    md
    pli
    hash_li
    new_cache
  ]


< (cache_path, md, from_lang, to_lang)=>
  [
    md
    pos_li
    hash_li
    cache
  ] = usedCache cache_path, ...merge(md)

  if pos_li.length
    to_tran = pick md,pos_li
    traned = []

    for await i from tranHtml(
      (await Promise.all(to_tran.map md2htm)).map (i)=>i.trim()
      to_lang
      from_lang
    )
      i = htm2md(i).replaceAll('\n',' ')
      traned.push i

  out = []

  for i,n in pos_li

    line = traned[n].trim()
    txt = md[i]
    trimStart = txt.trimStart()
    space = ''.padEnd txt.length - trimStart.length

    if line.startsWith('* ')
      line = trimStart[..1] + line[2..]

    cache.set(
      hash_li[n]
      utf8e md[i] = space + line
    )

  out = md.join('\n')

  write cache_path, cache.dump()
  assert(
    merge(out)[0].length == md.length
  )

  out

