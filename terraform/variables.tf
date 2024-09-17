# variables.tf
variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "region" {
  description = "The GCP region to deploy the resources"
  type        = string
  default     = "us-central1"
}