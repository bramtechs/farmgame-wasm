# WASM Farmgame

## Build

1. Install ldc, dub and the WASI SDK.

2. Add the WASI SDK to your path or **.bashrc**
```bash
# after installing wasi-sdk.deb
export WASI_SDK_PATH="/opt/wasi-sdk"
```
3. Build and run
```bash
# build and run
make && w4 run cart.wasm
# or for development 
w4 watch cart.wasm
```