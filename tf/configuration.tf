terraform {
  required_version = ">=1.9"
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "3.0.2"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.10.0"
    }
    time = {
      source  = "hashicorp/time"
      version = "0.12.1"
    }
  }

  #   backend "azurerm" {
  #     storage_account_name = "terraformstate"
  #     container_name       = "tfstate"
  #     key                  = "home.tfstate"
  #   }
}

provider "azurerm" {
  subscription_id     = var.subscription_id
  tenant_id           = var.tenant_id
  client_id           = var.client_id
  client_secret       = var.client_secret
  storage_use_azuread = true
  features {}
}

provider "azuread" {
  tenant_id     = var.tenant_id
  client_id     = var.client_id
  client_secret = var.client_secret
}

provider "time" {
}
