variable "location" {
description = "The Azure region where the Virtual Network will be created."
type        = string
}
variable "subnet_name" {
description = "The name of the subnet."
type        = string
}
variable "address_prefixes" {
description = "The address prefixes to use for the subnet."
type        = list(string)
}
variable "resource_group_name" {
description = "The name of the resource group in which to create the virtual network and subnet."
type        = string
}

variable "vnet_name" {
description = "The name of the virtual network."
type        = string
}
variable "delegation" {
  description = "The delegation configuration for the subnet."
  type = object({
    name               = string
    service_delegation = object({
      name    = string
      actions = list(string)
    })
  })
  default = null
}