terraform {
  required_version = ">=1.9"
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "3.1.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.16.0"
    }
  }

 	backend "remote" {
    organization = "jrnijboer"
    workspaces {
      name = "AzureTerraformHomelab" # name for your app's state.
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
