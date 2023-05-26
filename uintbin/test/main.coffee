#!/usr/bin/env coffee

> @w5/uintbin/uintBin
  @w5/uintbin/binUint

for n from [1,2,3333,0]
  bin = uintBin n
  console.log n, bin, binUint bin
