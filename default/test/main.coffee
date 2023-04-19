#!/usr/bin/env coffee

import '@w5/default'

m = new Map()
m.default(1,=>[]).push(7)
m.default(1,=>[]).push(8)
m.default(2,=>[]).push(9)

console.log m

