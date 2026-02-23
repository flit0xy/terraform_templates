resource "azurerm_container_registry" "container_registry" {
  name                = var.container_registry_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.sku
  admin_enabled       = var.admin_enabled
}
