output "cloud_run_url" {
  value = google_cloud_run_service.rns_service.status[0].url
}

output "service_name" {
  value = google_cloud_run_service.rns_service.name
}