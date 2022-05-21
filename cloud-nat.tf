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


resource "google_compute_address" "terraform_nat_ip" {
  count  = 1
  name   = "terraform-nat-ip-${count.index}"
  region = "${var.region}"
}



#Create Cloud nat
resource "google_compute_router_nat" "nat_manual" {
  name   = "nat-gke"
  router = google_compute_router.router.name
  region = "${var.region}"

  nat_ip_allocate_option = "MANUAL_ONLY"
  nat_ips                = google_compute_address.terraform_nat_ip.*.self_link

  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}
