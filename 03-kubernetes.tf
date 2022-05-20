module "gke" {
  source = "terraform-google-modules/kubernetes-engine/google//modules/private-cluster"
  project_id = var.project_id
  name = var.project_id
  region = var.region
  network = module.gcp_network.network_name
  subnetwork = module.gcp_network.subnets_names[0]
  ip_range_pods = var.ip_range_pods_name
  ip_range_services = var.ip_range_services_name
  node_pools = [
    {
      name = "gke-node-pool"
      machine_type = var.machine_type
      node_locations = var.node_locations
      min_count = 2
      max_count = 2
      disk_size_gb = 10
    }
  ]
}
