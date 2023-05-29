#!/usr/bin/env coffee

> ./stream.mjs
  fs > createReadStream

export default (fp)=>
  s = createReadStream(fp)
  stream s

