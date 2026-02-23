resource "azurerm_application_gateway" "app_gateway" {
  name                = var.app_gateway_name
  resource_group_name = var.resource_group_name
  location            = var.location

  sku {
    name     = "Standard_v2"
    tier     = "Standard_v2"
    capacity = 2
  }

  gateway_ip_configuration {
    name      = "appGatewayIpConfig"
    subnet_id = var.subnet_id
  }

  frontend_port {
    name = "http"
    port = var.frontend_port
  }

  frontend_ip_configuration {
    name                 = "appGatewayFrontendIP"
    public_ip_address_id = var.public_ip_address_id
  }

  backend_address_pool {
    name  = "backendPool"
    fqdns = [var.backend_fqdn]
  }

  backend_http_settings {
    name                                = "backendHttpSettings"
    cookie_based_affinity               = "Disabled"
    port                                = var.backend_port
    protocol                            = "Https"
    request_timeout                     = var.request_timeout
    pick_host_name_from_backend_address = false
    host_name                           = var.backend_fqdn
  }

  http_listener {
    name                           = "httpListener"
    frontend_ip_configuration_name = "appGatewayFrontendIP"
    frontend_port_name             = "http"
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = "rule1"
    rule_type                  = "Basic"
    http_listener_name         = "httpListener"
    backend_address_pool_name  = "backendPool"
    backend_http_settings_name = "backendHttpSettings"
    priority                   = 100
  }
}
