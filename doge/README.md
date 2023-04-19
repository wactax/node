[‼️]: ✏️README.mdt

# @w5/doge

[test/main.coffee](./test/main.coffee) :

```coffee
#!/usr/bin/env coffee

> @w5/doge

console.log Array.from(new Uint8Array(await crypto.subtle.digest(
  "SHA-1",
  new Uint8Array()
))).map((b) => b.toString(16).padStart(2, "0")).join('')
```

output :

```
da39a3ee5e6b4b0d3255bfef95601890afd80709
```
