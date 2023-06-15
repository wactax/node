#!/usr/bin/env coffee

> @w5/u8 > u8merge U8
  @w5/utf8/utf8e.js

bin = (s)=>
  if s.constructor == String
    s = utf8e s
  else if Array.isArray(s)
    s = U8 s
  s

< (prefix)=>
  prefix = bin prefix
  (args...)=>
    for i,p from args
      args[p] = bin i
    return u8merge prefix, ...args
