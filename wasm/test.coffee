#!/usr/bin/env coffee

> ./pkg/_ > BinSet vbyteE

testVbyte = =>
  console.log vbyteE [999, 2, 321]
  return

testVbyte()

testBinSet = =>
  set = new BinSet

  txt = """set.add(Buffer.from [1])
  set.has([2])
  set.has([1])
  set.add(new Uint8Array([1]))
  set.has([1])
  set.size
  set.dump()
  BinSet.load(set.dump(),1).size
  set.delete([1])
  set.size
  set.has([1])
  set.delete([1])
  set.has([2])""".split('\n')

  [
    set.add(Buffer.from [1])
    set.has([2])
    set.has([1])
    set.add(new Uint8Array([1]))
    set.has([1])
    set.dump()
    set.size
    BinSet.load(set.dump(),1).size
    set.delete([1])
    set.size
    set.has([1])
    set.delete([1])
    set.has([2])
  ].map (i,pos)=>console.log(txt[pos],'=',i)
  return
