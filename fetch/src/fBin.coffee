#!/usr/bin/env coffee
> ./index.js:f

< (args...)=>
  new Uint8Array await (await f ...args).arrayBuffer()

