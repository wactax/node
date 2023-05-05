#!/usr/bin/env coffee

> @w5/freqlimit

FL = freqlimit 2, 1e3

for i from [1..6]
  await FL()
  console.log '>',i

process.exit()

