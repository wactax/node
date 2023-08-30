#!/usr/bin/env coffee

> @w5/pool > Pool
  @w5/sleep:sleep

pool = Pool 2

job = (n)=>
  console.log n
  await sleep 1000*n
  console.log 'done\t',n

n = 0
while ++n<10
 await pool job,n

await pool.done
