
variable "project_name" {
  default = "alex-test-347514"
  type    = string
}
#region
variable "region" {
  default = "us-west1"
  type    = string
}
variable "zone" {
  default = "us-west1-a"
  type    = string
}

variable "instance_admin" {
  default = "admin"
  type    = string
}

variable "instance_cicd" {
  default = "cicd"
  type    = string
}
#gke
variable "cluster_name" {
  default = "modules-gke"
  type    = string
}
#networks
variable "vpc_namne" {
  default = "vpc-alex"
  type    = string
}

variable "mode" {
  default = "GLOBAL"
  type    = string
}

variable "ip_cidr_range" {
  default = "10.140.0.0/20"
  type    = string
}

variable "subnets_name" {
  default = "k8s-subnet"
  type    = string
}

variable "admin_ex_ip" {
  default = "admin-ex-ip"
  type    = string
}
variable "admin_in_ip" {
  default = "admin-in-ip"
  type    = string
}

variable "cicd_ex_ip" {
  default = "cicd-ex-ip"
  type    = string
}
variable "cicd_in_ip" {
  default = "cicd-in-ip"
  type    = string
}

variable "nat_ip_allocate_option" {
  description = "Value inferred based on nat_ips. If present set to MANUAL_ONLY, otherwise AUTO_ONLY."
  default     = "false"
}