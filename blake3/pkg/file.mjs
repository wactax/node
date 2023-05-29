#!/usr/bin/env -S node --loader=@w5/jsext --trace-uncaught --expose-gc --unhandled-rejections=strict --experimental-import-meta-resolve
import stream from './stream.mjs';

import {
  createReadStream
} from 'fs';

export default (fp) => {
  var s;
  s = createReadStream(fp);
  return stream(s);
};
