< (bin)=>
  if bin instanceof Uint8Array
    bin = Buffer.from bin
  len = bin.length
  if len == 0
    return 0
  bin.readUIntLE(0,len)

