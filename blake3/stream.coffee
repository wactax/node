#!/usr/bin/env coffee

> stream > Writable
  ./_.js > Blake3

export class Write extends Writable
  constructor:->
    super(...arguments)
    @blake3 = new Blake3
    return

  _write:(chunk, encoding, callback)->
    @blake3.update(chunk)
    callback()
    return

export default (stream)=>
  write = new Write()
  stream = stream.pipe(write)
  new Promise (resolve)=>
    write.on 'finish',->
      resolve @blake3.finalize()
      return
