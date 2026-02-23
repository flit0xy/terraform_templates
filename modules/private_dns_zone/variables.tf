variable "private_dns_zone_name" {
  description = "The name of the Private DNS Zone."
  type        = string
}
variable "resource_group_name" {
  description = "The name of the resource group in which to create the Private DNS Zone."
  type        = string
}
variable "dns_zone_vnet_link_name" {
  description = "The name of the Private DNS Zone Virtual Network Link."
  type        = string
}
variable "virtual_network_id" {
  description = "The ID of the Virtual Network to link with the Private DNS Zone."
  type        = string
}
