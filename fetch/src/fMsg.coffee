#!/usr/bin/env coffee

> ./fBin.js
  @w5/msgpack > unpack

export reqMsg = (args...)=>
  r = await fBin ...args
  unpack r

