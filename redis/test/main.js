#!/usr/bin/env -S node --loader=@w5/jsext --trace-uncaught --expose-gc --unhandled-rejections=strict --experimental-import-meta-resolve

// @w5/redis/R
import KV from '@w5/redis/KV';

console.log(KV);

// console.log R
await KV.sadd("test", "b");

await KV.sadd("test", ["c", 'd']);

// console.log await KV.get("test")
console.log((await KV.del("test")));

console.log('done');

process.exit();
