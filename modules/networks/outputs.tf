output "network_name" {
  value = "${google_compute_network.vpc_alex.name}"
}
output "subnets_name" {
  value = "${google_compute_subnetwork.vpc_alex_subnetwork.name}"
}
