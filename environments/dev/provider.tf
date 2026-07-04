terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.80.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "11111111-2222-3333-4444-555555555555"
}