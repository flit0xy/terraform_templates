output "web_app_id" {
    description = "The ID of the Web App"
    value       = azurerm_windows_web_app.window_web_app.id
}
output "web_app_default_hostname" {
    description = "The default hostname of the Web App"
    value       = azurerm_windows_web_app.window_web_app.default_hostname
}
output "web_app_private_hostname" {
    description = "The private hostname of the Web App"
    value       = "${azurerm_windows_web_app.window_web_app.name}.privatelink.azurewebsites.net"
}