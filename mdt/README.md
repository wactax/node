[‼️]: ✏️README.mdt

# @w5/mdt : 渲染 markdown 模板

模板文件参见 [./README.mdt](./README.mdt)

[test code](./test/main.coffee) :

```coffee
#!/usr/bin/env coffee

> @w5/mdt/make.js
  @w5/uridir

await make uridir(import.meta)
```

output :

```
/Users/z/wac.tax/node/mdt/test/test.mdt → test.md
```
