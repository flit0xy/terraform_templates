variable "firewall_name" {
  description = "The name of the Firewall"
  type        = string
}
variable "location" {
  description = "The location where the Firewall will be deployed"
  type        = string
}
variable "resource_group_name" {
  description = "The name of the Resource Group where the Firewall will be deployed"
  type        = string
}
variable "subnet_id" {
  description = "The ID of the subnet where the Firewall will be deployed"
  type        = string
}
variable "public_ip_address_id" {
  description = "The ID of the Public IP Address for the Firewall"
  type        = string
}