module "module-network" {
  source = "./modules/networks"
}
# Call our module and pass the var zone in, and get addresses out
module "module-addresses" {
  source = "./modules/address"
}


resource "google_compute_firewall" "allow-net" {
  name    = "allow-net"
  network = module.module-network.network_name
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["35.235.240.0/20"]
}

# Create  Cloud Router
resource "google_compute_router" "router" {
  name    = "nat-router"
  network = module.module-network.network_name
  region  = "us-west1"
}


#Create Cloud nat
module "cloud-nat" {
  source                             = "terraform-google-modules/cloud-nat/google"
  version                            = "~> 2.0.0"
  project_id                         = var.project_name
  region                             = "us-west1"
  router                             = google_compute_router.router.name
  name                               = "nat-gke"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}