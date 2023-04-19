#!/usr/bin/env coffee

import kebab from '@w5/kebab'

for i in 'str_li str2li i18n iI18n test-db User LIB_INDEX'.split(' ')
  console.log "#{i} → #{kebab i}"
