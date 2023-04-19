[‼️]: ✏️README.mdt

# @w5/taskli

[test/main.coffee](./test/main.coffee) :

```coffee
#!/usr/bin/env coffee

> @w5/taskli

add = taskli (task)=>
  console.log '\n',{task}
  if task == 2
    if task < 20*Math.random()
      return false
  return

add 1
add 2
add 3
#process.exit()
```

output :

```

 { task: 1 }

 { task: 2 }

 { task: 3 }
```
