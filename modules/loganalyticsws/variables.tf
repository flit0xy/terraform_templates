variable "workspace_name" {
    description = "The name of the Log Analytics Workspace."
    type        = string
}
variable "location" {
    description = "The location where the Log Analytics Workspace will be created."
    type        = string
}
variable "resource_group_name" {
    description = "The name of the resource group in which to create the Log Analytics Workspace."
    type        = string
}
variable "sku" {
    description = "The SKU of the Log Analytics Workspace."
    type        = string
}