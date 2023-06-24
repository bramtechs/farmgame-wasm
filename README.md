# WASM Farmgame

## Build with docker + docker-compose (recommended)

```
docker-compose up
```

## Build manually

1. Install npm, ldc, dub and the [WASI-sdk](https://github.com/WebAssembly/wasi-sdk/releases/tag/wasi-sdk-20).

```bash
sudo apt install npm ldc dub
```

2. Add the WASI-sdk to your path or **.bashrc**

```bash
echo 'export WASI_SDK_PATH="/opt/wasi-sdk"' >> ~/.bashrc
source ~/.bashrc
```

3. Install dependencies

```bash
npm install
```

3. Build and run

```bash
npm run web
```
