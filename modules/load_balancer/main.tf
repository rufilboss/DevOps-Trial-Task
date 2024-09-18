resource "google_compute_region_network_endpoint_group" "rns_neg" {
  name                  = "${var.service_name}-neg"
  network_endpoint_type = "SERVERLESS"
  region                = var.region

  cloud_run {
    service = var.cloud_run_service
  }
}

resource "google_compute_backend_service" "rns_backend" {
  name                            = "${var.service_name}-backend"
  protocol                        = "HTTP"
  load_balancing_scheme           = "EXTERNAL"
  port_name                       = "http"

  backend {
    group = google_compute_region_network_endpoint_group.rns_neg.id
  }
}

resource "google_compute_url_map" "rns_url_map" {
  name            = "${var.service_name}-url-map"
  default_service = google_compute_backend_service.rns_backend.id
}

resource "google_compute_target_http_proxy" "rns_http_proxy" {
  name    = "${var.service_name}-http-proxy"
  url_map = google_compute_url_map.rns_url_map.id
}

resource "google_compute_global_forwarding_rule" "rns_forwarding_rule" {
  name       = "${var.service_name}-forwarding-rule"
  target     = google_compute_target_http_proxy.rns_http_proxy.self_link
  port_range = "80"
}