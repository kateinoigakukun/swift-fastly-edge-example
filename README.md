# FastlyEdgeExample

An example project to deploy Swift code to Fastly's Compute@Edge

## Requirements

- SwiftWasm toolchain
- fastly CLI

## How to deploy

```console
$ fastly compute init
...
$ /Library/Developer/Toolchains/swift-wasm-5.5.0-RELEASE.xctoolchain/usr/bin/swift build --triple wasm32-unknown-wasi --product FastlyEdgeExample -c release
# optimize by wasm-opt to avoid size limitation
$ wasm-opt -Oz .build/wasm32-unknown-wasi/release/FastlyEdgeExample.wasm -o .build/wasm32-unknown-wasi/release/FastlyEdgeExample.wasm
$ fastly compute pack --wasm-binary=./.build/release/FastlyEdgeExample.wasm
$ fastly compute deploy
```

