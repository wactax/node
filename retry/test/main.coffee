#!/usr/bin/env coffee

> @w5/retry

test = retry =>
  console.log 'call test func'
  throw Error 'test'

test()
