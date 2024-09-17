variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "region" {
  description = "The region where the load balancer will be configured"
  type        = string
}

variable "cloudrun_url" {
  description = "URL of the CloudRun service"
  type        = string
}
