#!/usr/bin/env coffee

> @w5/nt > load

console.log load '''
# test
- a
- b
- c:
    - d:
      > t1
      > t2
'''


console.log load '''
a: 1
b:
  c:
    - 2
    - 3
'''
