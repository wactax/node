[‼️]: ✏️README.mdt

# @w5/kebab

[test/main.coffee](./test/main.coffee) :

```coffee
#!/usr/bin/env coffee

import kebab from '@w5/kebab'

for i in 'str_li str2li i18n iI18n test-db User LIB_INDEX'.split(' ')
  console.log "#{i} → #{kebab i}"
```

output :

```
str_li → str-li
str2li → str2li
i18n → i18n
iI18n → i-i18n
test-db → test-db
User → user
LIB_INDEX → lib-index
```
