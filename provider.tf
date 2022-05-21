terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 3.0"
    }
  }

  cloud {
    organization = "alex_test"
    workspaces {
      name = "terraform"
    }
  }

}
