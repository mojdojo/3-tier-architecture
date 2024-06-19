terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.95.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.6.1"
    }

  }
  backend "azurerm" {
    resource_group_name  = "manishRGState"
    storage_account_name = "statesstore"
    container_name       = "terraform-states"
    key                  = "RG-terraform.tfstate"
  }
}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }

  }
}
provider "random" {
  # Configuration options
}