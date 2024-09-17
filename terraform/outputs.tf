output "cloudrun_url" {
  value = module.cloudrun.cloudrun_url
}

output "db_instance_connection_name" {
  value = module.database.db_instance_connection_name
}

output "load_balancer_ip" {
  value = module.loadbalancer.load_balancer_ip
}
