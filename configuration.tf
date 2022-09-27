terraform {
  required_version = ">=1.0.1"
  required_providers {
    azuread = ">=2.6"
    azurerm = ">=2.80"
  }

  #   backend "azurerm" {
  #     storage_account_name = "terraformstate"
  #     container_name       = "tfstate"
  #     key                  = "home.tfstate"
  #   }
}

provider "azurerm" {
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  features {}
}

provider "azuread" {
  tenant_id     = var.tenant_id
  client_id     = var.client_id
  client_secret = var.client_secret
}
