# FastlyEdgeExample

An example project of Slack ping-pong command to deploy Swift code on Fastly's Compute@Edge


```swift
import Compute

struct Response: Codable {
    let text: String
    let response_type: String
}

@main
struct ComputeApp {
    static func main() async throws {
        try await onIncomingRequest { req, res in
            switch (req.method, req.url.path) {
            case (.post, "/command/ping-pong"):
                let content = Response(text: "pong", response_type: "in_channel")
                try await res.status(200).send(content)
            default:
                try await res.status(404).send()
            }
        }
    }
}
```

## Requirements

- SwiftWasm toolchain
- fastly CLI

## How to deploy

```console
$ fastly compute init
...
$ /Library/Developer/Toolchains/swift-wasm-5.5.0-RELEASE.xctoolchain/usr/bin/swift build --triple wasm32-unknown-wasi --product FastlyEdgeExample -c release
$ fastly compute pack --wasm-binary=./.build/release/FastlyEdgeExample.wasm
$ fastly compute deploy
```

