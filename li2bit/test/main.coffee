#!/usr/bin/env coffee

> @w5/li2bit

li = [1,0,0]
console.log li, li2bit(li).toString 2

li = [0,0,1]
console.log li, li2bit(li).toString 2
