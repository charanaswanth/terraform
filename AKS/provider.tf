terraform {
  required_version = ">= 1.5.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 5.10.0"
    }
  }

  backend "azurerm" {
    use_azuread_auth     = true
    resource_group_name  = "tfrg"
    storage_account_name = "tfbackend97"
    container_name       = "tfstate"
    key                  = "demo.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}