resource "azurerm_windows_web_app" "window_web_app" {
  name                = var.web_app_name
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = var.service_plan_id

  site_config {}

  app_settings = var.app_settings

  public_network_access_enabled = var.public_network_access == "Enabled" ? true : false
}
