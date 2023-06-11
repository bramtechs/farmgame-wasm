DUB_FLAGS = --compiler=ldc2 --quiet --arch wasm32-unknown-unknown-wasm --build release
ifneq ($(origin WASI_SDK_PATH), undefined)
	override DUB_FLAGS += --config wasi
endif

# Just rebuild every time because it's fast.
# cart.wasm: Makefile dub.json $(wildcard source/*.d)
.PHONY: build
build:
	dub build ${DUB_FLAGS}
	cp cart.wasm ./build/cart.wasm

clean:
	rm -rf cart.wasm .dub
