module "module-network" {
  source = "./modules/networks"
}
# Call our module and pass the var zone in, and get addresses out
module "module-addresses" {
  source = "./modules/address"
}


resource "google_compute_instance" "instance-admin" {
  name         = "${var.instance_admin}"
  zone         = "${var.zone}"
  machine_type = "e2-medium"


  #開機硬碟
  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-7"
      size  = 20
      type  = "pd-ssd"

    }
  }
  #標籤
  labels = {
    env = "terraform"
  }

  #指定網路
  network_interface {
    #指定為my-vpc-1
    network = module.module-network.network_name
    #指定子網路區段
    subnetwork = module.module-network.subnets_name
    #指定內網靜態IP
    network_ip = module.module-addresses.instance_admin_in_ip

    #賦予指定外部IP or 給空值就是隨機給
    access_config {
      nat_ip = module.module-addresses.instance_admin_ex_ip
    }
  }
}


resource "google_compute_instance" "instance-cicd" {
  name         = "${var.instance_cicd}"
  zone         = "${var.zone}"
  machine_type = "e2-medium"


  #開機硬碟
  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-7"
      size  = 30
      type  = "pd-ssd"

    }
  }
  #標籤
  labels = {
    env = "terraform"
  }

  #指定網路
  network_interface {
    #指定為my-vpc-1
    network = module.module-network.network_name
    #指定子網路區段
    subnetwork = module.module-network.subnets_name
    #指定內網靜態IP
    network_ip = module.module-addresses.instance_cicd_in_ip

    #賦予指定外部IP or 給空值就是隨機給
    access_config {
      nat_ip = module.module-addresses.instance_cicd_ex_ip
    }
  }
}

resource "google_compute_project_metadata" "alex" {
  metadata = {
    ssh-keys = <<EOF
      alex:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDbltnAvICqosll3+gVTeO44aXvwr3lapTjFH6hUlMlhi4v2dmt6oHPJdZ2/DHqa08JGBUR8RgQf0v1ho3oR/mLXYdAcpTSYJGQvYEYnYGTlZGZjVRBMDbO70pIxuQL3KwrT9a+1o2N/KRI+94Vr0A1/uFVOc+YhffdNLfyP40PNARmDOWTJIl5iyXlPN4Y3+xb4CQJFeXLaR95xZdC6/tmV7B499kqdK30Fw1t8x/6kdYSMkj1LN1+1gOGgwB0u++TCBTcw9cGp0emHhZnz2Jb0fvGa2XQGLtluP0evYcdPxlHh0cSv4fUskgUHHjKUxxQmcSv3TZBySTxDvVuf281 alex
    EOF
  }
}


resource "google_compute_project_metadata" "mac" {
  metadata = {
    ssh-keys = <<EOF
      alex:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCo3bgF13faZAvM8rqVi1q+OSzYucUiFfEuvHWmREhPmZ1/bLeA4fed8ifrVtDkj8D4DH02Y59lKRCxQP3kSY/sde++o8ohQXBknUdCKJAA/WSmDZhH+WbN+h4XW+z4Xo9b4z/OhT3DcVsmWmvF0noiWTkSQdKc3uT2q+ef6K+Iq1mBlw/0gMmnmjxfdD926kzo4hok9jKuo93cq4Wak8aWe5X7tQKTPczyywMPkQ/LID4VEUEqNp3lmhD+Xv1aNKj/mj08bF8BE/qrjP2D1q4RdipF0UG9Hf5fXC8wqJ9Q1UZUuNV20KoQm3tuc6ADjdavl4A4mQsGclEddZmztp2bAKDGMEoqt3MmIpmApIeymlYq3Bl5lmhh4vEMf2eOtf47gR4QFobKgDZLN1H9re/3Y73RrDwng5PN4Mo7lsD4ySCQoABzTMW8xnppj3K+2FtolFIrozNf1UD1D7PqSb4SM+TvOEIn+oaMew2srPRr9QHwGdwsgHjA8/cH/d1SlXM= alex
    EOF
  }
}