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
      ip_cidr_range = local.pods_cidr_range
      range_name    = "gke-${var.project_id}-gke-pods-72af974f"
    },
    {
      ip_cidr_range = local.services_cidr_range
      range_name    = "gke-${var.project_id}-gke-services-72af974f"
    },
  ]
}
