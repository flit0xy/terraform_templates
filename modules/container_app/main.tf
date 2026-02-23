resource "azurerm_container_app" "container_app" {
  name                         = var.container_app_name
  resource_group_name          = var.resource_group_name
  container_app_environment_id = var.container_app_environment_id

  revision_mode = "Single"

  ingress {
    target_port      = 80
    external_enabled = true
    traffic_weight {
      percentage         = var.percent
      latest_revision = var.latest_revision
    }
  }

  template {

    container {
      name   = var.container_name
      image  = var.container_image
      cpu    = var.cpu
      memory = var.memory

      env {
        name  = "ENVIRONMENT"
        value = var.environment
      }
    }
    max_replicas = var.scale.max_replicas
    min_replicas = var.scale.min_replicas
  }
  identity {
    type = "SystemAssigned"
  }
  registry {
    server = var.registry_server
    identity = "system"
  }
}
