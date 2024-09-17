resource "google_compute_global_address" "default" {
  name = "lb-ip"
}

resource "google_compute_url_map" "urlmap" {
  name            = "url-map"
  default_service = var.cloudrun_url
}

resource "google_compute_target_http_proxy" "http_proxy" {
  name    = "http-proxy"
  url_map = google_compute_url_map.urlmap.self_link
}

resource "google_compute_global_forwarding_rule" "http_forwarding_rule" {
  name       = "http-rule"
  target     = google_compute_target_http_proxy.http_proxy.self_link
  port_range = "80"
  ip_address = google_compute_global_address.default.address
}
