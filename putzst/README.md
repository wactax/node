[‼️]: ✏️README.mdt

# @w5/putzst

[test/main.coffee](./test/main.coffee) :

```coffee
#!/usr/bin/env coffee

> @w5/putzst
  @w5/uridir

ROOT = uridir(import.meta)

console.log await putzst ROOT
```

output :

```
	 BACKBLAZE test.tar.zst 100%
https://f003.backblazeb2.com/file/artbak-redis/test.tar.zst
undefined
```
