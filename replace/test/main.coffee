#!/usr/bin/env coffee

> @w5/replace

console.log replace(
  '''01<a>
      1

      </a>23'''
  '<a>'
  '</a>'
  (i)=>
    console.log [i]
    i.trim()
)
