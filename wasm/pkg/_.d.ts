/* tslint:disable */
/* eslint-disable */
/**
* @param {Uint8Array} bin
* @returns {string}
*/
export function b64E(bin: Uint8Array): string;
/**
* @param {string} bin
* @returns {Uint8Array}
*/
export function b64D(bin: string): Uint8Array;
/**
* @param {number} n
* @returns {Uint8Array}
*/
export function u64Bin(n: number): Uint8Array;
/**
* @param {number} n
* @returns {string}
*/
export function u64B64(n: number): string;
/**
* @param {Float64Array} vs
* @returns {Uint8Array}
*/
export function vbyteE(vs: Float64Array): Uint8Array;
/**
* @param {Uint8Array} vs
* @returns {Float64Array}
*/
export function vbyteD(vs: Uint8Array): Float64Array;
/**
* @param {Float64Array} vs
* @returns {string}
*/
export function b64VbyteE(vs: Float64Array): string;
/**
* @param {string} vs
* @returns {Float64Array}
*/
export function b64VbyteD(vs: string): Float64Array;
/**
* @param {Float64Array} vs
* @returns {string}
*/
export function z85VbyteE(vs: Float64Array): string;
/**
* @param {string} vs
* @returns {Float64Array}
*/
export function z85VbyteD(vs: string): Float64Array;
/**
* @param {Uint8Array} bin
* @returns {string}
*/
export function z85E(bin: Uint8Array): string;
/**
* @param {string} bin
* @returns {Uint8Array}
*/
export function z85D(bin: string): Uint8Array;
/**
*/
export class BinMap {
  free(): void;
/**
*/
  constructor();
/**
*/
  clear(): void;
/**
* @param {Uint8Array} key
* @returns {boolean}
*/
  delete(key: Uint8Array): boolean;
/**
* @param {Uint8Array} key
* @param {any} val
*/
  set(key: Uint8Array, val: any): void;
/**
* @param {Uint8Array} key
* @returns {any}
*/
  get(key: Uint8Array): any;
/**
*/
  readonly size: number;
}
/**
*/
export class BinSet {
  free(): void;
/**
*/
  constructor();
/**
* @returns {(Uint8Array)[]}
*/
  clear(): (Uint8Array)[];
/**
* @param {Uint8Array} val
* @returns {boolean}
*/
  add(val: Uint8Array): boolean;
/**
* @param {Uint8Array} val
* @returns {boolean}
*/
  has(val: Uint8Array): boolean;
/**
* @param {Uint8Array} val
* @returns {boolean}
*/
  delete(val: Uint8Array): boolean;
/**
*/
  readonly size: number;
}

export type InitInput = RequestInfo | URL | Response | BufferSource | WebAssembly.Module;

export interface InitOutput {
  readonly memory: WebAssembly.Memory;
  readonly __wbg_binmap_free: (a: number) => void;
  readonly binmap_new: () => number;
  readonly binmap_clear: (a: number) => void;
  readonly binmap_size: (a: number) => number;
  readonly binmap_delete: (a: number, b: number, c: number) => number;
  readonly binmap_set: (a: number, b: number, c: number, d: number) => void;
  readonly binmap_get: (a: number, b: number, c: number) => number;
  readonly b64E: (a: number, b: number, c: number) => void;
  readonly b64D: (a: number, b: number, c: number) => void;
  readonly __wbg_binset_free: (a: number) => void;
  readonly binset_new: () => number;
  readonly binset_clear: (a: number, b: number) => void;
  readonly binset_add: (a: number, b: number, c: number) => number;
  readonly binset_has: (a: number, b: number, c: number) => number;
  readonly binset_delete: (a: number, b: number, c: number) => number;
  readonly binset_size: (a: number) => number;
  readonly u64Bin: (a: number, b: number) => void;
  readonly u64B64: (a: number, b: number) => void;
  readonly vbyteE: (a: number, b: number, c: number) => void;
  readonly vbyteD: (a: number, b: number, c: number) => void;
  readonly b64VbyteE: (a: number, b: number, c: number) => void;
  readonly b64VbyteD: (a: number, b: number, c: number) => void;
  readonly z85VbyteE: (a: number, b: number, c: number) => void;
  readonly z85VbyteD: (a: number, b: number, c: number) => void;
  readonly z85E: (a: number, b: number, c: number) => void;
  readonly z85D: (a: number, b: number, c: number) => void;
  readonly __wbindgen_malloc: (a: number, b: number) => number;
  readonly __wbindgen_add_to_stack_pointer: (a: number) => number;
  readonly __wbindgen_free: (a: number, b: number, c: number) => void;
  readonly __wbindgen_realloc: (a: number, b: number, c: number, d: number) => number;
}

export type SyncInitInput = BufferSource | WebAssembly.Module;
/**
* Instantiates the given `module`, which can either be bytes or
* a precompiled `WebAssembly.Module`.
*
* @param {SyncInitInput} module
*
* @returns {InitOutput}
*/
export function initSync(module: SyncInitInput): InitOutput;

/**
* If `module_or_path` is {RequestInfo} or {URL}, makes a request and
* for everything else, calls `WebAssembly.instantiate` directly.
*
* @param {InitInput | Promise<InitInput>} module_or_path
*
* @returns {Promise<InitOutput>}
*/
export default function __wbg_init (module_or_path?: InitInput | Promise<InitInput>): Promise<InitOutput>;
