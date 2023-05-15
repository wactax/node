#!/usr/bin/env coffee

> @w5/retry
  ./_req.js:req

export default retry (url,option)=>
  (await req(url,option)).json()
