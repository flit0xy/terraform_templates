variable "web_app_name" {
    description = "The name of the Windows Web App"
    type        = string
}
variable "location" {
    description = "The Azure location where the web application will be deployed"
    type        = string
}
variable "resource_group_name" {
    description = "The name of the resource group"
    type        = string
}
variable "service_plan_id" {
    description = "The ID of the App Service Plan"
    type        = string
}
variable "app_settings" {
    description = "A map of app settings for the web application"
    type        = map(string)
}
variable "public_network_access" {
    description = "Enable or Disable public network access to the web app. Possible values are 'Enabled' or 'Disabled'."
    type        = string
    default     = "Enabled"
}