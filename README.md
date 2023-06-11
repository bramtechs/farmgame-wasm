# WASM Farmgame

## Build

1. Install ldc, dub and the WASI SDK.

2. Add the [WASI SDK](https://github.com/WebAssembly/wasi-sdk/releases/tag/wasi-sdk-20) to your path or **.bashrc**

```bash
echo 'export WASI_SDK_PATH="/opt/wasi-sdk"' >> ~/.bashrc
```

3. Build and run

```bash
# build and run
make && w4 run cart.wasm
# or for development
w4 watch cart.wasm
```
