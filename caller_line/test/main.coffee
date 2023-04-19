#!/usr/bin/env coffee

> @w5/caller_line

test = =>
  throw Error()

do =>
  try
    test()
  catch
    console.log CallerLine()

