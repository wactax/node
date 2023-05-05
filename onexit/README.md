[‼️]: ✏️README.mdt

# @w5/onexit

[test/main.coffee](./test/main.coffee) :

```coffee
#!/usr/bin/env coffee

> @w5/onexit

sleep = (n)=>
  new Promise (resolve)=>
    setTimeout(
      resolve
      n
    )
    return

onexit =>
  console.log 'onexit'
  await sleep(1000)
  console.log 'exit after sleep'
  return
```

output :

```
123
```
