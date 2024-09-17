resource "google_sql_database_instance" "db_instance" {
  name             = "db-instance"
  database_version = "POSTGRES_13"
  region           = var.region

  settings {
    tier = "db-f1-micro"
  }
}

resource "google_sql_database" "db" {
  name     = "service-db"
  instance = google_sql_database_instance.db_instance.name
}

resource "google_sql_user" "db_user" {
  name     = "db_user"
  instance = google_sql_database_instance.db_instance.name
  password = "secure_password"  # This should be replace with a proper secret management system
}
