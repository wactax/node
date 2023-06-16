#!/usr/bin/env coffee

> @w5/i18n
  @w5/uridir

do =>
  # i18n uridir(import.meta)
  process.exit()
  return
#console.log cookie2dict 'I=1665481017; test=1665492012'

###
> ./lib/render:

template = 'Example text: ${text}'
result = template.render {
  text: 'Foo Boo'
}
console.log result
###
