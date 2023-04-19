[‼️]: ✏️README.mdt

# @w5/replace

[test/main.coffee](./test/main.coffee) :

```coffee
#!/usr/bin/env coffee

> @w5/replace

console.log replace(
  '''01<a>
      1

      </a>23'''
  '<a>'
  '</a>'
  (i)=>
    console.log [i]
    i.trim()
)
```

output :

```
[ '\n1\n\n' ]
01<a>1</a>23
```
