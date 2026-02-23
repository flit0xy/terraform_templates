variable "private_endpoint_name" {
  description = "The name of the Private Endpoint"
  type        = string
}
variable "location" {
  description = "The Azure region where the Private Endpoint will be deployed"
  type        = string
}
variable "resource_group_name" {
  description = "The name of the resource group in which to create the Private Endpoint"
  type        = string
}
variable "subnet_id" {
  description = "The ID of the subnet where the Private Endpoint will be created"
  type        = string
}
variable "resource_id" {
  description = "The ID of the resource to which the Private Endpoint will connect"
  type        = string
}
variable "subresource_names" {
  description = "The names of the sub-resources for the Private Endpoint connection"
  type        = list(string)
}
variable "private_service_connection" {
  type = object({
    name                           = string
    private_connection_resource_id = string
    is_manual_connection           = bool
    subresource_names              = list(string)
  })
}
variable "private_dns_zone_group" {
  type = object({
    name                 = string
    private_dns_zone_ids = list(string)
  })
}
