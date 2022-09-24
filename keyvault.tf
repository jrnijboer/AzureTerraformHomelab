#tfsec:ignore:azure-keyvault-specify-network-acl:exp:2022-08-01 tfsec:ignore:azure-keyvault-no-purge:exp:2022-08-01 Requires more impact research
resource "azurerm_key_vault" "key_vault" {
  name                = "home-key-vault"
  resource_group_name = azurerm_resource_group.home_rg.name
  location            = local.location
  sku_name            = "standard"
  tenant_id           = var.tenant_id
  tags                = local.common_tags
}

data "azurerm_client_config" "current" {}

