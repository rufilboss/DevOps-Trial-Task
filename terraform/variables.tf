variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "region" {
  description = "The GCP region to deploy the resources"
  type        = string
  default     = "us-central1"
}

variable "cloudrun_url" {
  description = "URL of the CloudRun service"
  type        = string
}
