#!/usr/bin/env coffee

> @w5/retry
  ./_req.js:req

export default retry (url,option)=>
  new Uint8Array(
    await (await req(url,option)).arrayBuffer()
  )
