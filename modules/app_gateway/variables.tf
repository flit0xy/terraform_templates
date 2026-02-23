variable "app_gateway_name" {
  description = "The name of the Application Gateway."
  type        = string
}
variable "resource_group_name" {
  description = "The name of the resource group in which to create the Application Gateway."
  type        = string
}
variable "location" {
  description = "The Azure region where the Application Gateway will be created."
  type        = string
}
variable "subnet_id" {
  description = "The ID of the subnet in which to deploy the Application Gateway."
  type        = string
}
variable "frontend_port" {
  description = "The frontend port for the Application Gateway."
  type        = number
}
variable "public_ip_address_id" {
  description = "The ID of the public IP address to associate with the Application Gateway."
  type        = string
}
variable "backend_port" {
  description = "The backend port for the Application Gateway."
  type        = number
  default     = 80
}
variable "request_timeout" {
  description = "The request timeout for the backend HTTP settings."
  type        = number
  default     = 20
}
variable "backend_fqdn" {
  description = "The FQDN of the backend pool."
  type        = string
}