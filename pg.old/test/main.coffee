#!/usr/bin/env coffee

> @w5/pg

Q = await pg process.env.PG_URI

console.log await Q.browser.get(1)

process.exit()
