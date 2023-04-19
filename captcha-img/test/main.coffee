#!/usr/bin/env coffee

> @w5/uridir
  @w5/captcha-img
  path > join
  fs > writeFileSync
  @w5/sleep

ROOT = uridir(import.meta)

n = 0
while ++n < 10
  [img, x, y, size, id] = await CaptchaImg(750,40)
  console.log(n, x, y, size, id)
  await sleep 0
  #gc()
  #console.log img
  #writeFileSync(
  #  join ROOT,"demo/#{n}.webp"
  #  Buffer.from img
  #)
  #gc()
