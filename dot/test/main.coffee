#!/usr/bin/env coffee

> @w5/dot

func = dot (name)=> (a, b)=>
  [name,a,b].join '-'

console.log func.test(1,2)
