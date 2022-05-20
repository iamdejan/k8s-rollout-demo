module "gcp_network" {
  source = "terraform-google-modules/network/google"
  project_id = var.project_id
  network_name = var.network_name
  subnets = [
    {
      subnet_name = local.subnetwork_name
      subnet_ip = "10.10.0.0/16"
      subnet_region = local.region
    }
  ]
  secondary_ranges = {
    "${var.subnetwork_name}" = [
      {
        range_name = local.ip_range_pods_name
        ip_cidr_range = "10.20.0.0/16"
      },
      {
        range_name = local.ip_range_services_name
        ip_cidr_range = "10.30.0.0/16"
      }
    ]
  }
}
