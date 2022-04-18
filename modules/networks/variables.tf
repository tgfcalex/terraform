variable "vpc_namne" {
  default     = "vpc-alex"
  type        = string
}

variable "mode" {
  default     = "GLOBAL"
  type        = string
}

variable "ip_cidr_range" {
  default     = "10.140.0.0/20"
  type        = string
}

variable "subnets_name" {
  default     = "k8s-subnet"
  type        = string
}

variable "region" {
  default     = "us-west1"
  type        = string
}
