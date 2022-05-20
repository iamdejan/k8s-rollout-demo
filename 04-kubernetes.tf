module "gke" {
  source = "terraform-google-modules/kubernetes-engine/google//modules/private-cluster"
  project_id = var.project_id
  name = var.project_id
  region = local.region
  network = module.gcp_network.network_name
  subnetwork = module.gcp_network.subnets_names[0]
  ip_range_pods = local.ip_range_pods_name
  ip_range_services = local.ip_range_services_name

  node_pools = [
    {
      name = local.node_pool_name
      machine_type = local.machine_type
      node_locations = local.node_locations
      min_count = 2
      max_count = 2
      disk_size_gb = 10
    }
  ]

  node_pools_oauth_scopes = {
    all = []

    default-node-pool = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }

  node_pools_labels = {
    all = {}

    default-node-pool = {
      default-node-pool = true
    }
  }
}
