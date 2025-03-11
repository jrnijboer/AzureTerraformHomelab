resource "azurerm_storage_account" "home_storage_account" {
  name                            = "nijboerhomelabsa"
  resource_group_name             = azurerm_resource_group.home_rg.name
  location                        = local.location
  account_tier                    = "Standard"
  account_replication_type        = "GRS"
  nfsv3_enabled                   = false
  min_tls_version                 = "TLS1_2"
  public_network_access_enabled   = true
  shared_access_key_enabled       = false
  allow_nested_items_to_be_public = false
  tags                            = local.common_tags

  network_rules {
    default_action = "Deny"
    bypass         = ["Logging", "Metrics", "AzureServices"]
    ip_rules = [
      "213.10.245.254"
    ]
  }

  blob_properties {
    versioning_enabled       = false
    change_feed_enabled      = false
    last_access_time_enabled = false
    delete_retention_policy { # blob policy
      days = 30
    }

    container_delete_retention_policy {
      days = 30
    }
  }
}

data "azuread_user" "myuser" {
  object_id = "92b87317-1d6f-4528-b596-1a2cd204d1d2"
}

# Assigning storage contributor roles is needed because shared access keys are disabled
resource "azurerm_role_assignment" "storage_account_blob_contributor_ra" {
  scope                = azurerm_storage_account.home_storage_account.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = var.client_id
}

resource "azurerm_role_assignment" "myuser_storage_account_blob_contributor_ra" {
  scope                = azurerm_storage_account.home_storage_account.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = data.azuread_user.myuser.object_id
}

resource "azurerm_storage_container" "terraform_state_container" {
  name                  = "tfstate"
  storage_account_id    = azurerm_storage_account.home_storage_account.id
  container_access_type = "private"
}


