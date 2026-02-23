resource "azurerm_app_service_virtual_network_swift_connection" "webapp_vnet_integration" {
    app_service_id = var.web_app_id
    subnet_id      = var.subnet_id
}
