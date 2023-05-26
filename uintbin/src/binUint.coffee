< (bin)=>
  len = bin.length
  if len == 0
    return 0
  bin.readUIntLE(0,len)

