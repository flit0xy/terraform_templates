variable "service_plan_name" {
  description = "The name of the App Service Plan."
  type        = string
}
variable "location" {
  description = "The Azure region where the App Service Plan will be created."
  type        = string
}
variable "resource_group_name" {
  description = "The name of the resource group in which to create the App Service Plan."
  type        = string
}
variable "os_type" {
  description = "The operating system type for the App Service Plan."
  type        = string
  default     = "Windows"
}
variable "sku_name" {
  description = "The SKU name for the App Service Plan."
  type        = string
  default     = "S1"
}
