#!/usr/bin/env coffee

> ./fBin.js
  @w5/msgpack > unpack

< (args...)=>
  unpack await fBin ...args

