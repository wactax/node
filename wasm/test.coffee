#!/usr/bin/env coffee

> ./pkg/_ > BinMap b64VbyteD b64VbyteE u64B64

console.log u64B64 12345

testVbyte = =>
  b = b64VbyteE [999, 2, 321]
  console.log b
  console.log b64VbyteD b
  return

# testVbyte()

testBinMap = =>
  map = new BinMap
  r = =>
    12345

  key = new Uint8Array([1,2])
  map.set key, r
  console.log map.size
  r = map.get(key)
  console.log r()

testBinMap()

  # set = new BinSet
  #
  # txt = """set.add(Buffer.from [1])
  # set.has([2])
  # set.has([1])
  # set.add(new Uint8Array([1]))
  # set.has([1])
  # set.size
  # set.dump()
  # BinSet.load(set.dump(),1).size
  # set.delete([1])
  # set.size
  # set.has([1])
  # set.delete([1])
  # set.has([2])""".split('\n')
  #
  # [
  #   set.add(Buffer.from [1])
  #   set.has([2])
  #   set.has([1])
  #   set.add(new Uint8Array([1]))
  #   set.has([1])
  #   set.dump()
  #   set.size
  #   BinSet.load(set.dump(),1).size
  #   set.delete([1])
  #   set.size
  #   set.has([1])
  #   set.delete([1])
  #   set.has([2])
  # ].map (i,pos)=>console.log(txt[pos],'=',i)
  # return
