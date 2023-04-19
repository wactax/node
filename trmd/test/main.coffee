#!/usr/bin/env coffee

> @w5/trmd
  @w5/uridir
  @w5/read
  path > join

PWD = uridir import.meta

pwd = (p...)=>
  join PWD, ...p

name = 'en.md'

fp = pwd name

console.log await trmd(
  fp
  (lang)=>
    pwd lang+'.md'
  'en'
  [
    'es'
  ]
)

process.exit()
