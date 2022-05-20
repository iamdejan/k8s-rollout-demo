module "gcp_network" {
  source = "terraform-google-modules/network/google"
  project_id = var.project_id
  network_name = var.network_name
  subnets = [
    {
      subnet_name = var.subnetwork_name
      subnet_ip = "10.10.0.0/16"
      subnet_region = var.region
    }
  ]
}
