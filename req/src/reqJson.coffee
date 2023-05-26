#!/usr/bin/env coffee

> @w5/retry
  ./req.js

export default (url,option)=>
  r = await req(url,option)
  if r.status == 200
    try
      return await r.json()
    catch err
      console.error error
  throw r
