[‼️]: ✏️README.mdt

# @w5/wget

[test/main.coffee](./test/main.coffee) :

```coffee
#!/usr/bin/env coffee

> @w5/wget

await wget 'http://ipinfo.io/json', 'test.out'
```

down to test.out :

```
{
  "ip": "120.245.2.174",
  "city": "Zhanjiang",
  "region": "Guangdong",
  "country": "CN",
  "loc": "21.2339,110.3875",
  "org": "AS56048 China Mobile Communicaitons Corporation",
  "timezone": "Asia/Shanghai",
  "readme": "https://ipinfo.io/missingauth"
}
```
