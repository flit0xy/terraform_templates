resource "azurerm_container_app_environment" "container_app_env" {
  name                = "${var.container_app_name}-env"
  location            = var.location
  resource_group_name = var.resource_group_name
}