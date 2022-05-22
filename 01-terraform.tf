terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.52.0"
    }
  }

  backend "gcs" {
    bucket = "k8s-rollout-demo-terraform-state"
    prefix = "/rollout-demo"
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
  zone    = "${var.region}-a"
}
