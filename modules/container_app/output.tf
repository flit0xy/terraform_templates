output "container_app" {
  value = azurerm_container_app.container_app.id
}
output "principal_id" {
  value = azurerm_container_app.container_app.identity[0].principal_id
  
}