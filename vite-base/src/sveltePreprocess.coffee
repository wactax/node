#!/usr/bin/env coffee

import sveltePreprocess from '@w5/svelte-preprocess'

export default [
  sveltePreprocess(
    coffeescript: {
      label:true
      sourceMap: true
    }
    #customElement:true
    stylus: true
    pug: true
  )
]
