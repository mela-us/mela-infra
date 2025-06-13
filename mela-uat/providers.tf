terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.32.0"
    }
  }

  cloud {
    organization = "mela"
    workspaces {
      name = "mela-infra-uat"
    }
  }
}

provider "azurerm" {
  features {}
}
