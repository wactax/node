#!/usr/bin/env coffee

> @w5/extract > extract extractLi
console.log extract('12<a>b</a>23','<a>','</a>')
for i from extractLi('<a>a</a>12<a>b</a>23','<a>','</a>')
  console.log i

