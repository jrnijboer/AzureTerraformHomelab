#tfsec:ignore:azure-keyvault-specify-network-acl:exp:2022-08-01 tfsec:ignore:azure-keyvault-no-purge:exp:2022-08-01 Requires more impact research
resource "azurerm_key_vault" "key_vault" {
  name                       = "home-key-vault"
  resource_group_name        = azurerm_resource_group.home_rg.name
  location                   = local.location
  sku_name                   = "standard"
  tenant_id                  = var.tenant_id
  tags                       = local.common_tags
  purge_protection_enabled   = true
  soft_delete_retention_days = 90
  network_acls {
    default_action = "Deny"
    bypass         = "AzureServices"
    ip_rules = [
      "213.10.245.254"
    ]
  }
}

resource "azurerm_key_vault_key" "hashicorp_key" { #tfsec:ignore:azure-keyvault-ensure-key-expiry
  depends_on   = [time_sleep.wait_30_seconds]
  name         = "hashicorp-vault-unseal"
  key_vault_id = azurerm_key_vault.key_vault.id
  key_type     = "RSA"
  key_size     = 2048
  tags         = local.common_tags

  key_opts = [
    "wrapKey",
    "unwrapKey",
  ]
}
