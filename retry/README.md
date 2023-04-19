[‼️]: ✏️README.mdt

# @w5/retry

[test/main.coffee](./test/main.coffee) :

```coffee
#!/usr/bin/env coffee

> @w5/retry

test = retry =>
  console.log 'call test func'
  throw Error 'test'

test()
```

output :

```
call test func
call test func
call test func
call test func
call test func
call test func
call test func
call test func
call test func
call test func
```
