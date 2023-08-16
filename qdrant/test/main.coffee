#!/usr/bin/env coffee

> @w5/qdrant:Q


console.log await Q.GET.collections()

console.log await Q.POST.collections.clip.points {
  ids:[2,5]
  with_payload: true
}
