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
  machine_type = "e2-standard-2"


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
