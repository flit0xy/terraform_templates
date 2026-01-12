variable "diagnostic_setting_name" {
    description = "The name of the Diagnostic Setting."
    type        = string
}
variable "target_resource_id" {
    description = "The ID of the resource to which the Diagnostic Setting will be applied."
    type        = string
}
variable "log_analytics_workspace_id" {
    description = "The ID of the Log Analytics Workspace where logs and metrics will be sent."
    type        = string
}
variable "enabled_log" {
  description = "Diagnostic logs"
  type = list(object({
    category = string
    enabled  = bool
    retention_policy = object({
      enabled = bool
      days    = number
    })
  }))
  default = []
}

variable "metric" {
  description = "Diagnostic metrics"
  type = list(object({
    category = string
    enabled  = bool
    retention_policy = object({
      enabled = bool
      days    = number
    })
  }))
  default = []
}
