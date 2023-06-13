#!/usr/bin/env coffee

> @w5/retry
  ./_req.js:req
  msgpackr > unpack

export default retry (url,option)=>
  unpack new Uint8Array(
    await (await req(url,option)).arrayBuffer()
  )
