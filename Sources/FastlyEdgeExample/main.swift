import _CFastlyEdge
#if canImport(WASILibc)
import WASILibc
#endif

var body: body_handle_t = 0
fastly_http_body_new(&body)

var response: response_handle_t = 0
fastly_http_resp_new(&response)

let hello = "Hello from Swift at Compute@Edge"
hello.withCString { buf in
    var nwritten = 0
    let bufLength = strlen(buf)
    let buf = UnsafeRawPointer(buf).assumingMemoryBound(to: UInt8.self)
    fastly_http_body_write(body, buf, bufLength, body_write_end_front, &nwritten)
}

fastly_http_resp_send_downstream(response, body, 0)
