[‼️]: ✏️README.mdt

# @w5/ossput

[test/main.coffee](./test/main.coffee) :

```coffee
#!/usr/bin/env coffee

> @w5/ossput
  fs > createReadStream

await ossput(
  (new Date()-0).toString(36)
  =>
    createReadStream import.meta.url[7..]
  'text/coffeescript'
)
```

output :

```
./out.txt
```
