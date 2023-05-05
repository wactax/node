#!/usr/bin/env coffee

> @w5/lru

test = lru(3) (n)=>
  console.log {n}
  return n

console.log await test 1
console.log await test 2
console.log await test 3
console.log await test 4
console.log await test 1
console.log await test 2
console.log await test 4
