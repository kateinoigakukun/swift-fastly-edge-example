#ifndef _CFastlyEdge_h
#define _CFastlyEdge_h

#include <stdint.h>

typedef int32_t fastly_status_t;
typedef int32_t response_handle_t;
typedef int32_t body_handle_t;

enum body_write_end : uint32_t {
  body_write_end_back = 0,
  body_write_end_front = 1,
};

__attribute__((__import_module__("fastly_http_body"),
               __import_name__("new")))
fastly_status_t fastly_http_body_new(body_handle_t *body_handle);

__attribute__((__import_module__("fastly_http_body"),
               __import_name__("write")))
fastly_status_t fastly_http_body_write(body_handle_t body_handle, const uint8_t *buf, size_t buf_len, enum body_write_end end, size_t *nwritten_out);


__attribute__((__import_module__("fastly_http_resp"),
               __import_name__("new")))
fastly_status_t fastly_http_resp_new(response_handle_t *resp_handle);

__attribute__((__import_module__("fastly_http_resp"),
               __import_name__("send_downstream")))
fastly_status_t fastly_http_resp_send_downstream(response_handle_t resp_handle, body_handle_t body_handle, int32_t streaming);

#endif
