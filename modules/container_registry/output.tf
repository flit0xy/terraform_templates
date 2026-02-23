output "container_registry_id" {
  description = "The ID of the Container Registry"
  value       = azurerm_container_registry.container_registry.id
  
}
output "login_server" {
  description = "The login server of the Container Registry"
  value       = azurerm_container_registry.container_registry.login_server
}
output "name" {
  description = "The name of the Container Registry"
  value       = azurerm_container_registry.container_registry.name
  
}