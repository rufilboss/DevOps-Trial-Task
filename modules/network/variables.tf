variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "region" {
  description = "Region for the subnet"
  type        = string
}

variable "network_name" {
  description = "Name of the VPC network"
  type        = string
}

variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
}

variable "cidr_block" {
  description = "CIDR block for the subnet"
  type        = string
}