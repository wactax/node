#!/usr/bin/env -S node --loader=@w5/jsext --trace-uncaught --expose-gc --unhandled-rejections=strict --experimental-import-meta-resolve
var T;

import avat from '@w5/avat';

import * as mod from '../mod.js';

T = avat(mod);

T.xyz(123)(246);
