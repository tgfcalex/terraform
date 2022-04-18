resource "google_compute_firewall" "alex-home" {
  allow {
    protocol = "all"
  }
  direction     = "INGRESS"
  disabled      = "false"
  name          = "alex-home"
  network       = "${var.vpc_namne}"
  priority      = "1000"
  source_ranges = ["182.234.224.9"]
}


resource "google_compute_firewall" "allow-internal" {
  allow {
    protocol = "all"
  }
  direction     = "INGRESS"
  disabled      = "false"
  name          = "allow-internal"
  network       = "${var.vpc_namne}"
  priority      = "999"
  source_ranges = ["10.140.0.0/20"]
}
