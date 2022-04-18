resource "google_compute_address" "instance_admin_ex" {
  name = "${var.admin_ex_ip}"
  region       = "${var.region}"
}

resource "google_compute_address" "instance_admin_in" {
  name         = "${var.admin_in_ip}"
  subnetwork   = "${var.subnet_name}"
  address_type = "INTERNAL"
  region       = "${var.region}"
}

resource "google_compute_address" "instance_cicd_ex" {
  name = "${var.cicd_ex_ip}"
  region       = "${var.region}"
}

resource "google_compute_address" "instance_cicd_in" {
  name         = "${var.cicd_in_ip}"
  subnetwork   = "${var.subnet_name}"
  address_type = "INTERNAL"
  region       = "${var.region}"
}
