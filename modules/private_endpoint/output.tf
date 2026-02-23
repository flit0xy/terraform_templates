output "private_endpoint_id" {
  description = "The ID of the Private Endpoint"
  value       = azurerm_private_endpoint.private_endpoint.id
  
}