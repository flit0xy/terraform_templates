output "service_plan_id" {
    description = "The ID of the App Service Plan"
    value       = azurerm_service_plan.app_service_plan.id
}
output "web_app_id" {
    description = "The ID of the Web App"
    value       = azurerm_windows_web_app.window_web_app.id
}