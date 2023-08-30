[‼️]: ✏️README.mdt

# @w5/pool

[test/main.coffee](./test/main.coffee) :

```coffee
#!/usr/bin/env coffee

> @w5/pool > Pool
  @w5/sleep:sleep

pool = Pool 5

job = (n)=>
  console.log n
  await sleep 1000*n
  console.log 'done\t',n

n = 0
while ++n<10
 await pool job,n

await pool.done
```

output :

```
1
2
3
4
5
done	 1
6
done	 2
done	 3
done	 4
done	 5
done	 6
7
8
9
done	 7
done	 8
done	 9
```
