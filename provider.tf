terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 3.0"
    }
  }
  required_version = ">= 0.13"
}

  cloud {
    organization = "alex_test"
    workspaces {
      name = "terraform"
    }
  }

}
