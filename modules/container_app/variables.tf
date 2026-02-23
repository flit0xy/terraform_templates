variable "container_app_name" {
    description = "The name of the web application"
    type        = string
}
variable "location" {
    description = "The Azure location where the web application will be deployed"
    type        = string
}
variable "resource_group_name" {
    description = "The name of the resource group in which to create the web application"
    type        = string
}
variable "container_app_environment_id" {
    description = "The ID of the Container App Environment"
    type        = string
}
variable "container_name" {
    description = "The name of the container"
    type        = string
}
variable "container_image" {
    description = "The container image to deploy"
    type        = string
}
variable "cpu" {
    description = "The CPU allocation for the container"
    type        = string
}
variable "memory" {
    description = "The memory allocation for the container"
    type        = string
}
variable "environment" {
    description = "The environment variable to set in the container"
    type        = string
}
variable "scale" {
  description = "The scale settings for the container app"
  type        = object({
    min_replicas = number
    max_replicas = number
  })
}
variable "target_port" {
  description = "The target port for the container app"
  type        = number
}
variable "external_enabled" {
  description = "Enable external ingress for the container app"
  type        = bool
  default     = true
}
variable "percent" {
  description = "The percentage of traffic to route to the latest revision"
  type        = number
  default     = 100
}
variable "latest_revision" {
  description = "Whether to route traffic to the latest revision"
  type        = bool
  default     = true
}
variable "registry_server" {
  description = "The server of the container registry"
  type        = string
}
