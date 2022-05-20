terraform {
  backend "gcs" {
    bucket = "k8s-rollout-demo-terraform-state"
    prefix = "/rollout-demo"
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}
