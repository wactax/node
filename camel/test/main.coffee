#!/usr/bin/env coffee

import camel from '@w5/camel'

for i in 'index.htm str_li str2li i18n iI18n test-db User LIB_INDEX'.split(' ')
  console.log "#{i} → #{camel i}"
