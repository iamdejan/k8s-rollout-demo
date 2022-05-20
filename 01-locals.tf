locals {
  region = "asia-southeast1"
  zone = "asia-southeast1-a"
  network_name = "k8s-rollout-demo-network"
  subnetwork_name = "k8s-rollout-demo-subnetwork"
  ip_range_pods_name = "k8s-rollout-demo-ip-range-pods"
  ip_range_services_name = "k8s-rollout-demo-ip-range-services"
  node_locations = "asia-southeast1-a,asia-southeast1-b,asia-southeast1-c"
  machine_type = "e2-micro"
  node_pool_name = "gke-node-pool"
}
