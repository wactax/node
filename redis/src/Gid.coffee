#!/usr/bin/env coffee

> ./ID.js
  ./KV.js
  @w5/uintbin/uintBin

{gid} = ID

< (cid)=>
  id = await gid()
  await KV.hset 'cid', uintBin(id), uintBin(cid)
  id
