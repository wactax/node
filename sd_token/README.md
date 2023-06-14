[‼️]: ✏️README.mdt

# @w5/sd_token

[test/main.coffee](./test/main.coffee) :

```coffee
#!/usr/bin/env coffee

> @w5/sd_token/a.js:sdA
#   @w5/uridir
#   path > join

# ROOT = uridir(import.meta)

console.log sdA(
  '''(RAW photo, best quality), (realistic, photo-realistic:1.2), 1girl, high quality, (high detailed skin:1.4), puffy eyes, gorgeous hair, <lora:epiNoiseoffset_v2:1.8>, (dark room:1.3), (rim lighting:1.3), (dimly lit:1.3), (dark night:1.3), indoors, portrait, black hair, dark background, short hair, <lora:koreanDollLikeness_v15:0.4>, <lora:breastinclassBetter_v13:0.4>, <lora:fashionGirl_v47:0.4>,
(worst quality:1.4), (low quality:1.4), (monochrome:1.1), EasyNegative, bad-artist bad-image-v2-39000, bad_prompt_version2, ng_deepnegative_v1_75t, verybadimagenegative_v1.2-6400, vile_prompt3, bad-hands-5, painting, illustration,
EasyNegative,nudity,(completley naked:1.5),(worst quality:1.25),(low quality:1.5),(lowres:1.5),(monochome:1.5),(greyscale:1.5),multiple views,(large breasts:1.5),loli,(titles:2),(text:2),(letters:2),extra fingers,((extra leg)),bad leg,bad feet,bad hands,bad anatomy
'''
  new Map [
    [
      'breastinclassbetter_v13',
      'http://xx.com/breastinclassBetter_v1'
    ]
  ]
  new Map [
    [
      'easynegative',
      "http://xx.com/easynegative"
    ]
  ]
)
```

output :

```
(RAW photo, best quality), (realistic, photo-realistic:1.2), 1girl, high quality, (high detailed skin:1.4), puffy eyes, gorgeous hair, &lt;lora:epiNoiseoffset_v2:1.8&gt;, (dark room:1.3), (rim lighting:1.3), (dimly lit:1.3), (dark night:1.3), indoors, portrait, black hair, dark background, short hair, &lt;lora:koreanDollLikeness_v15:0.4&gt;, <a href="http://xx.com/breastinclassBetter_v1">&lt;lora:breastinclassBetter_v13:0.4&gt;</a>, &lt;lora:fashionGirl_v47:0.4&gt;,  (worst quality:1.4), (low quality:1.4), (monochrome:1.1), <a href="http://xx.com/easynegative">EasyNegative</a>, bad-artist bad-image-v2-39000, bad_prompt_version2, ng_deepnegative_v1_75t, verybadimagenegative_v1.2-6400, vile_prompt3, bad-hands-5, painting, illustration,  <a href="http://xx.com/easynegative">EasyNegative</a>, nudity, (completley naked:1.5), (worst quality:1.25), (low quality:1.5), (lowres:1.5), (monochome:1.5), (greyscale:1.5), multiple views, (large breasts:1.5), loli, (titles:2), (text:2), (letters:2), extra fingers, ((extra leg)), bad leg, bad feet, bad hands, bad anatomy
```
