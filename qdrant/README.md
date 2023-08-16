[‼️]: ✏️README.mdt

# @w5/qdrant

[test/main.coffee](./test/main.coffee) :

```coffee
#!/usr/bin/env coffee

> @w5/qdrant:Q


console.log await Q.GET.collections()

{points} = Q.POST.collections.clip
console.log await points {
  ids:[2,5]
  with_payload: true
}
console.log await points {
  ids:[2,5]
  with_payload: true
}
```

output :

```
{ collections: [ { name: 'clip' } ] }
[
  {
    id: 5,
    payload: { day: 19489, h: 4096, nsfw: false, w: 2048 },
    vector: null
  },
  {
    id: 2,
    payload: { day: 19489, h: 768, nsfw: false, w: 512 },
    vector: null
  }
]
[
  {
    id: 2,
    payload: { day: 19489, h: 768, nsfw: false, w: 512 },
    vector: null
  },
  {
    id: 5,
    payload: { day: 19489, h: 4096, nsfw: false, w: 2048 },
    vector: null
  }
]
```
