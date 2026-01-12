variable "public_ip_name" {
    description = "The name of the Public IP"
    type        = string
}
variable "location" {
    description = "The location where the Public IP will be created"
    type        = string
}
variable "resource_group_name" {
    description = "The name of the Resource Group where the Public IP will be created"
    type        = string
}
