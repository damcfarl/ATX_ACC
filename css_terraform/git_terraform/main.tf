terraform {
  required_version = ">= 1.0.1"
}

terraform {
  required_providers {
    aci = {
      source  = "CiscoDevNet/aci"
      version = "=0.7.1"
    }
  }
}

provider "aci" {
  username = var.aci_username
  password = var.aci_password
  url      = var.aci_url
#  insecure = true
}

terraform {
  backend "local" {
    path="/home/cisco/projects/aci/tf_state/terraform.tfstate"
  }
}

