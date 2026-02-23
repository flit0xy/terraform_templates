variable "container_app_name" {
  description = "The name of the container app environment"
  type        = string
}
variable "location" {
  description = "The Azure location where the container app environment will be deployed"
  type        = string
}
variable "resource_group_name" {
  description = "The name of the resource group in which to create the container app environment"
  type        = string
}