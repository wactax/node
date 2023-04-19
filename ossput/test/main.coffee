#!/usr/bin/env coffee

> @w5/ossput
  fs > createReadStream

await ossput(
  (new Date()-0).toString(36)
  =>
    createReadStream import.meta.url[7..]
  'text/coffeescript'
)

