#!/usr/bin/env coffee

import { register } from "node:module"
import { pathToFileURL } from "node:url"

register("@w5/loader/loader.js", pathToFileURL("./"))
