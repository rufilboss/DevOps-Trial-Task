resource "google_cloud_run_service" "service" {
  name     = "my-cloudrun-service"
  location = var.region

  template {
    spec {
      containers {
        image = "gcr.io/${var.project_id}/hello-sample"  # container image
      }
    }
  }

  autogenerate_revision_name = true
}

resource "google_cloud_run_service_iam_policy" "noauth" {
  location = google_cloud_run_service.service.location
  project  = var.project_id
  service  = google_cloud_run_service.service.name

  policy_data = <<EOF
{
  "bindings": [
    {
      "role": "roles/run.invoker",
      "members": [
        "allUsers"
      ]
    }
  ]
}
EOF
}
