resource "azurerm_resource_group" "home_rg" {
  name     = "home-rg"
  location = local.location
  tags     = local.common_tags
}