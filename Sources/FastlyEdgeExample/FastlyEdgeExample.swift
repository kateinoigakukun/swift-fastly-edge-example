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
