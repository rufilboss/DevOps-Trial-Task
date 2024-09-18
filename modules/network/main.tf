resource "google_project_service" "servicenetworking" {
  service             = "servicenetworking.googleapis.com"
  disable_on_destroy  = false
}

resource "google_compute_network" "rns_network" {
  name                    = var.network_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "rns_subnet" {
  name          = var.subnet_name
  ip_cidr_range = var.cidr_block
  network       = google_compute_network.rns_network.id
  region        = var.region
}

resource "google_compute_global_address" "private_service_ip" {
  name          = "${var.project_id}-private-service-ip"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 24  
  network       = google_compute_network.rns_network.id

  depends_on = [
    google_project_service.servicenetworking,
  ]
}

resource "google_service_networking_connection" "private_vpc_connection" {
  network                 = google_compute_network.rns_network.self_link
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.private_service_ip.name]

  depends_on = [
    google_compute_global_address.private_service_ip,
  ]
}