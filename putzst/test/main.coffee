#!/usr/bin/env coffee

> @w5/putzst
  @w5/uridir

ROOT = uridir(import.meta)

console.log await putzst ROOT
