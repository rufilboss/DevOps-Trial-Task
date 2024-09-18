resource "google_cloud_run_service" "rns_service" {
  name     = var.service_name
  location = var.region

  template {
    metadata {
      annotations = {
        "run.googleapis.com/cloudsql-instances" = var.cloudsql_connection
      }
    }
    spec {
      containers {
        image = var.image
        env {
          name  = "DB_USER"
          value = var.db_user
        }
        env {
          name  = "DB_PASSWORD"
          value = var.db_password
        }
        env {
          name  = "DB_NAME"
          value = var.db_name
        }
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}

resource "google_cloud_run_service_iam_member" "rns_invoker" {
  service  = google_cloud_run_service.rns_service.name
  location = google_cloud_run_service.rns_service.location
  role     = "roles/run.invoker"
  member   = "allUsers"
}