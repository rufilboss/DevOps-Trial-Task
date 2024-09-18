variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "region" {
  description = "The GCP region"
  type        = string
  default     = "us-central1"
}

variable "cidr_block" {
  description = "CIDR block for the subnet"
  type        = string
  default     = "10.0.0.0/16"
}

variable "db_instance_name" {
  description = "Name of the Cloud SQL instance"
  type        = string
  default     = "rns-db-instance"
}

variable "db_user" {
  description = "Database user name"
  type        = string
  default     = "rns_db_user"
}

variable "db_password" {
  description = "Database user password"
  type        = string
  sensitive   = true
}

variable "db_name" {
  description = "Name of the initial database"
  type        = string
  default     = "rns_database"
}

variable "service_name" {
  description = "Name of the Cloud Run service"
  type        = string
  default     = "rns-cloud-run-service"
}

variable "image" {
  description = "Container image to deploy"
  type        = string
  default     = "gcr.io/yusadolat/hello"
}