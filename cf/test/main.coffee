#!/usr/bin/env coffee

> @w5/cf
  @w5/cf/Zone

for i from await cf.GET()
  {name,id} = i
  console.log name
  {
    argo
    settings
  } = Zone(id)
  await settings.ssl 'strict'
  break
