output "cloud_run_url" {
  value       = module.cloud_run.cloud_run_url
  description = "The URL of the Cloud Run service"
}

output "load_balancer_ip" {
  value       = module.load_balancer.load_balancer_ip
  description = "The IP address of the load balancer"
}