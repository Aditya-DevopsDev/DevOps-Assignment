# ==============================
# Enable Required APIs
# ==============================

resource "google_project_service" "artifact_registry" {
  service = "artifactregistry.googleapis.com"
}

resource "google_project_service" "cloud_run" {
  service = "run.googleapis.com"
}

# ==============================
# Artifact Registry
# ==============================

resource "google_artifact_registry_repository" "backend_repo" {
  location      = var.region
  repository_id = "${var.environment}-backend-repo"
  description   = "Backend Docker repository"
  format        = "DOCKER"

  depends_on = [
    google_project_service.artifact_registry
  ]
}

# ==============================
# Cloud Run Service
# ==============================

resource "google_cloud_run_service" "backend" {
  name     = "${var.environment}-backend-service"
  location = var.region

  template {
    spec {
      containers {
        image = "${var.region}-docker.pkg.dev/${var.project_id}/${google_artifact_registry_repository.backend_repo.repository_id}/backend:latest"

        ports {
          container_port = 3000
        }

        resources {
          limits = {
            memory = "512Mi"
            cpu    = "1"
          }
        }
      }

      container_concurrency = 80
    }

    metadata {
      annotations = {
        "autoscaling.knative.dev/minScale" = "0"
        "autoscaling.knative.dev/maxScale" = "2"
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }

  depends_on = [
    google_project_service.cloud_run
  ]
}

# ==============================
# Make Cloud Run Public
# ==============================

resource "google_cloud_run_service_iam_member" "public_access" {
  service  = google_cloud_run_service.backend.name
  location = google_cloud_run_service.backend.location
  role     = "roles/run.invoker"
  member   = "allUsers"
}