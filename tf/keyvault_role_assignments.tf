# data "azuread_service_principal" "terraform_sp" {
#   display_name = "terraform_service_principle"
# }

# data "azuread_user" "myuser" {
#   user_principal_name = var.admin_id
# }

resource "azurerm_role_assignment" "role_hashicorp_vault_kv_secrets_ra" {
  scope                = azurerm_key_vault.key_vault.id
  role_definition_name = "Key Vault Secrets User"
  principal_id         = var.client_id
}

resource "azurerm_role_assignment" "role_hashicorp_vault_kv_crypto_ra" {
  scope                = azurerm_key_vault.key_vault.id
  role_definition_name = "Key Vault Crypto User"
  principal_id         = var.client_id
}

# resource "azurerm_key_vault_access_policy" "terraform_sp_ap" {
#   key_vault_id = azurerm_key_vault.key_vault.id
#   tenant_id    = var.tenant_id
#   object_id    = data.azuread_service_principal.terraform_sp.object_id

#   key_permissions = [
#     "Get",
#     "List",
#     "Update",
#     "Create",
#     "Import",
#     "Delete",
#     "Recover",
#     "Purge",
#     "WrapKey",
#     "UnwrapKey",
#     "GetRotationPolicy"
#   ]

#   secret_permissions = [
#     "Get",
#     "List",
#     "Set",
#     "Delete",
#     "Recover",
#     "Purge"
#   ]

#   certificate_permissions = [
#     "Get",
#     "List",
#     "Update",
#     "Create",
#     "Import",
#     "Delete",
#     "Recover",
#     "Purge"
#   ]
# }

# resource "azurerm_key_vault_access_policy" "myuser_ap" {
#   key_vault_id = azurerm_key_vault.key_vault.id
#   tenant_id    = var.tenant_id
#   object_id    = data.azuread_user.myuser.object_id

#   key_permissions = [
#     "Get",
#     "List",
#     "Update",
#     "Create",
#     "Import",
#     "Delete",
#     "Recover",
#     "Purge",
#     "WrapKey",
#     "UnwrapKey",
#     "Backup"
#   ]

#   secret_permissions = [
#     "Get",
#     "List",
#     "Set",
#     "Delete",
#     "Recover",
#     "Purge"
#   ]

#   certificate_permissions = [
#     "Get",
#     "List",
#     "Update",
#     "Create",
#     "Import",
#     "Delete",
#     "Recover",
#     "Purge"
#   ]
# }

# resource "time_sleep" "wait_30_seconds" {
#   depends_on      = [azurerm_key_vault_access_policy.terraform_sp_ap, azurerm_key_vault_access_policy.myuser_ap]
#   create_duration = "60s"
# }
