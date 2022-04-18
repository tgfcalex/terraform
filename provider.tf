terraform {
        required_providers {
                google = {
            version = "~> 4.11.0"
               }
  }

  cloud {
    organization = "alex_test"
    workspaces {
      name = "terraform"
    }
  }

}
