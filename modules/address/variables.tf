variable "admin_ex_ip" {
  default     = "admin-ex-ip"
  type        = string
}
variable "admin_in_ip" {
  default     = "admin-in-ip"
  type        = string
}
variable "cicd_ex_ip" {
  default     = "cicd-ex-ip"
  type        = string
}
variable "cicd_in_ip" {
  default     = "cicd-in-ip"
  type        = string
}
variable "region" {
  default     = "us-west1"
  type        = string
}

variable "subnet_name" {
  default     = "k8s-subnet"
  type        = string
}
