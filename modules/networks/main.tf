resource "google_compute_network" "vpc_alex"{
  name                       = "${var.vpc_namne}"
  routing_mode               = "${var.mode}"
  auto_create_subnetworks    = "false"
}

resource "google_compute_subnetwork" "vpc_alex_subnetwork"{
ip_cidr_range = "${var.ip_cidr_range}"
name          = "${var.subnets_name}"
network       = "${google_compute_network.vpc_alex.name}"
region        = "${var.region}"
}
