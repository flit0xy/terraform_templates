variable "container_registry_name" {
  description = "The name of the container registry"
  type        = string
}
variable "location" {
  description = "The location of the container registry"
  type        = string
}
variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}
variable "sku" {
  description = "The SKU of the container registry"
  type        = string
  default     = "Basic"
}
variable "admin_enabled" {
  description = "Enable admin user for the container registry"
  type        = bool
  default     = true
}