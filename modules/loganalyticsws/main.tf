resource "azurerm_log_analytics_workspace" "log_analytics_workspace" {
  name                = var.workspace_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.sku
}