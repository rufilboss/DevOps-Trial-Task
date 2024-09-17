module "cloudrun" {
  source = "./modules/cloudrun"
  project_id = var.project_id
  region     = var.region
}

module "database" {
  source = "./modules/database"
  project_id = var.project_id
  region     = var.region
}

module "loadbalancer" {
  source = "./modules/loadbalancer"
  project_id = var.project_id
  region     = var.region
  cloudrun_url = var.cloudrun_url
}
