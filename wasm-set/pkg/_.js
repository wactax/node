let imports = {};
imports['__wbindgen_placeholder__'] = module.exports;
let wasm;
const { TextDecoder } = require(`util`);

let cachedTextDecoder = new TextDecoder('utf-8', { ignoreBOM: true, fatal: true });

cachedTextDecoder.decode();

let cachedUint8Memory0 = null;

function getUint8Memory0() {
    if (cachedUint8Memory0 === null || cachedUint8Memory0.byteLength === 0) {
        cachedUint8Memory0 = new Uint8Array(wasm.memory.buffer);
    }
    return cachedUint8Memory0;
}

function getStringFromWasm0(ptr, len) {
    return cachedTextDecoder.decode(getUint8Memory0().subarray(ptr, ptr + len));
}

let WASM_VECTOR_LEN = 0;

function passArray8ToWasm0(arg, malloc) {
    const ptr = malloc(arg.length * 1);
    getUint8Memory0().set(arg, ptr / 1);
    WASM_VECTOR_LEN = arg.length;
    return ptr;
}

let cachedInt32Memory0 = null;

function getInt32Memory0() {
    if (cachedInt32Memory0 === null || cachedInt32Memory0.byteLength === 0) {
        cachedInt32Memory0 = new Int32Array(wasm.memory.buffer);
    }
    return cachedInt32Memory0;
}

function getArrayU8FromWasm0(ptr, len) {
    return getUint8Memory0().subarray(ptr / 1, ptr / 1 + len);
}

const BinSetFinalization = new FinalizationRegistry(ptr => wasm.__wbg_binset_free(ptr));
/**
*/
class BinSet {

    static __wrap(ptr) {
        const obj = Object.create(BinSet.prototype);
        obj.ptr = ptr;
        BinSetFinalization.register(obj, obj.ptr, obj);
        return obj;
    }

    __destroy_into_raw() {
        const ptr = this.ptr;
        this.ptr = 0;
        BinSetFinalization.unregister(this);
        return ptr;
    }

    free() {
        const ptr = this.__destroy_into_raw();
        wasm.__wbg_binset_free(ptr);
    }
    /**
    */
    constructor() {
        const ret = wasm.binset_new();
        return BinSet.__wrap(ret);
    }
    /**
    * @param {Uint8Array} val
    * @returns {boolean}
    */
    add(val) {
        const ptr0 = passArray8ToWasm0(val, wasm.__wbindgen_malloc);
        const len0 = WASM_VECTOR_LEN;
        const ret = wasm.binset_add(this.ptr, ptr0, len0);
        return ret !== 0;
    }
    /**
    * @param {Uint8Array} val
    * @returns {boolean}
    */
    has(val) {
        const ptr0 = passArray8ToWasm0(val, wasm.__wbindgen_malloc);
        const len0 = WASM_VECTOR_LEN;
        const ret = wasm.binset_has(this.ptr, ptr0, len0);
        return ret !== 0;
    }
    /**
    * @param {Uint8Array} val
    * @returns {boolean}
    */
    delete(val) {
        const ptr0 = passArray8ToWasm0(val, wasm.__wbindgen_malloc);
        const len0 = WASM_VECTOR_LEN;
        const ret = wasm.binset_delete(this.ptr, ptr0, len0);
        return ret !== 0;
    }
    /**
    * @returns {number}
    */
    get size() {
        const ret = wasm.binset_size(this.ptr);
        return ret >>> 0;
    }
    /**
    * @returns {Uint8Array}
    */
    dump() {
        try {
            const retptr = wasm.__wbindgen_add_to_stack_pointer(-16);
            wasm.binset_dump(retptr, this.ptr);
            var r0 = getInt32Memory0()[retptr / 4 + 0];
            var r1 = getInt32Memory0()[retptr / 4 + 1];
            var v0 = getArrayU8FromWasm0(r0, r1).slice();
            wasm.__wbindgen_free(r0, r1 * 1);
            return v0;
        } finally {
            wasm.__wbindgen_add_to_stack_pointer(16);
        }
    }
    /**
    * @param {Uint8Array} li
    * @param {number} n
    * @returns {BinSet}
    */
    static load(li, n) {
        const ptr0 = passArray8ToWasm0(li, wasm.__wbindgen_malloc);
        const len0 = WASM_VECTOR_LEN;
        const ret = wasm.binset_load(ptr0, len0, n);
        return BinSet.__wrap(ret);
    }
}
module.exports.BinSet = BinSet;

module.exports.__wbindgen_throw = function(arg0, arg1) {
    throw new Error(getStringFromWasm0(arg0, arg1));
};

const path = require('path').join(__dirname, '__bg.wasm');
const bytes = require('fs').readFileSync(path);

const wasmModule = new WebAssembly.Module(bytes);
const wasmInstance = new WebAssembly.Instance(wasmModule, imports);
wasm = wasmInstance.exports;
module.exports.__wasm = wasm;

