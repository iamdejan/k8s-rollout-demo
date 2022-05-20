variable "project_id" {
  description = "GCP Project ID in which infrastructure will be provisioned."
}

variable "region" {
  description = "Region in which cluster will be created."
  default = "asia-southeast2"
}

variable "zone" {
  description = "Chosen zone inside region."
  default = "asia-southeast2-a"
}

variable "network_name" {
  default = "k8s-rollout-demo-network"
}

variable "subnetwork_name" {
  default = "k8s-rollout-demo-subnetwork"
}

variable "ip_range_pods_name" {
  default = "k8s-rollout-demo-ip-range-pods"
}

variable "ip_range_services_name" {
  default = "k8s-rollout-demo-ip-range-services"
}

variable "node_locations" {
  description = "Zone in which K8s nodes will be located. Must be within specified region."
  default = "asia-southeast2-a,asia-southeast2-b,asia-southeast2-c"
}

variable "machine_type" {
  description = "Instance machine type."
  default = "e2-micro"
}
