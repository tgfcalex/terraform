output "instance_admin_ex_ip" {
  value = "${google_compute_address.instance_admin_ex.address}"
}
output "instance_admin_in_ip" {
  value = "${google_compute_address.instance_admin_in.address}"
}
output "instance_cicd_ex_ip" {
  value = "${google_compute_address.instance_cicd_ex.address}"
}
output "instance_cicd_in_ip" {
  value = "${google_compute_address.instance_cicd_in.address}"
}
