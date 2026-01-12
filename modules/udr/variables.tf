variable "route_table_name" {
  description = "The name of the route table."
  type        = string
}
variable "location" {
  description = "The location where the route table will be created."
  type        = string
}
variable "resource_group_name" {
  description = "The name of the resource group in which to create the route table."
  type        = string
}
variable "route" {
  description = "A list of routes to be added to the route table."
  type = list(object({
    name                   = string
    address_prefix         = string
    next_hop_type          = string
    next_hop_in_ip_address = optional(string)
  }))

}
variable "subnet_id" {
  description = "The ID of the subnet to associate with the route table."
  type        = string
}
variable "route_table_id" {
  description = "The ID of the route table to associate with the subnet."
  type        = string
}
