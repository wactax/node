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
