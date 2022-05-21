resource "google_compute_firewall" "allow-net" {
  name    = "allow-net"
  network = "${var.vpc_namne}"
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["35.235.240.0/20"]
}

# Create  Cloud Router
resource "google_compute_router" "router" {
  name    = "nat-router"
  network = "${var.vpc_namne}"
  region  = "us-west1"
}


resource "google_compute_address" "terraform-nat-ip" {
  name = "terraform-nat-ip"
  region       = "${var.region}"
}

#Create Cloud nat
module "cloud-nat" {
  source                             = "terraform-google-modules/cloud-nat/google"
  version                            = "~> 2.0.0"
  project_id                         = var.project_name
  region                             = "us-west1"
  router                             = google_compute_router.router.name
  name                               = "nat-gke"
  nat_ip_allocate_option             = "MANUAL_ONLY"
  nat_ips                            = "google_compute_address.terraform-nat-ip.address
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}