import wasm_mod from "./__bg.wasm?url";


export const vbyteE = (args...)=>{
  if args.length == 1 {
    args = args[0]
    if(!Array.isArray(args)){
      args = [args]
    }
  }
  return _vbyteE(args)
}

await (async () => {
const imports = __wbg_get_imports();
__wbg_init_memory(imports);
const { instance, module } = await __wbg_load(
  await fetch(wasm_mod), imports
);
__wbg_finalize_init(instance, module);
})();
