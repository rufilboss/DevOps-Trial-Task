terraform {
  required_version = ">= 0.12"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_project_service" "run" {
  service = "run.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "sqladmin" {
  service = "sqladmin.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "compute" {
  service = "compute.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "servicenetworking" {
  service = "servicenetworking.googleapis.com"
  disable_on_destroy = false
}

module "network" {
  source       = "./modules/network"
  project_id   = var.project_id
  region       = var.region
  network_name = "${var.project_id}-rns-network"
  subnet_name  = "${var.project_id}-rns-subnet"
  cidr_block   = var.cidr_block
}


module "cloud_sql" {
  source            = "./modules/cloud_sql"
  project_id        = var.project_id
  region            = var.region
  db_instance_name  = var.db_instance_name
  db_user           = var.db_user
  db_password       = var.db_password
  db_name           = var.db_name
  network_self_link = module.network.network_self_link
}

module "cloud_run" {
  source              = "./modules/cloud_run"
  project_id          = var.project_id
  region              = var.region
  service_name        = var.service_name
  image               = var.image
  db_user             = var.db_user
  db_password         = var.db_password
  db_name             = var.db_name
  cloudsql_connection = module.cloud_sql.connection_name
}

module "load_balancer" {
  source            = "./modules/load_balancer"
  project_id        = var.project_id
  region            = var.region
  service_name      = var.service_name
  cloud_run_service = module.cloud_run.service_name
}