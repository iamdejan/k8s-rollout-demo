# VPC
resource "google_compute_network" "vpc" {
  name                    = "${var.project_id}-vpc"
  auto_create_subnetworks = "false"
}

# Subnet
resource "google_compute_subnetwork" "subnet" {
  name          = "${var.project_id}-subnet"
  region        = var.region
  network       = google_compute_network.vpc.name
  ip_cidr_range = "10.10.0.0/24"
  secondary_ip_range = [
    {
      ip_cidr_range = "10.244.0.0/14"
      range_name    = "gke-${var.project_id}-gke-pods-72af974f"
    },
    {
      ip_cidr_range = "10.248.0.0/20"
      range_name    = "gke-${var.project_id}-gke-services-72af974f"
    },
  ]
}
