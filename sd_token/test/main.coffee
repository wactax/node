#!/usr/bin/env coffee

> @w5/sd_token
#   @w5/uridir
#   path > join

# ROOT = uridir(import.meta)

console.log await SdToken(
  '''(RAW photo, best quality), (realistic, photo-realistic:1.2), 1girl, high quality, (high detailed skin:1.4), puffy eyes, gorgeous hair, <lora:epiNoiseoffset_v2:1.8>, (dark room:1.3), (rim lighting:1.3), (dimly lit:1.3), (dark night:1.3), indoors, portrait, black hair, dark background, short hair, <lora:koreanDollLikeness_v15:0.4>, <lora:breastinclassBetter_v13:0.4>, <lora:fashionGirl_v47:0.4>,
(worst quality:1.4), (low quality:1.4), (monochrome:1.1), EasyNegative, bad-artist bad-image-v2-39000, bad_prompt_version2, ng_deepnegative_v1_75t, verybadimagenegative_v1.2-6400, vile_prompt3, bad-hands-5, painting, illustration,
'''
)
