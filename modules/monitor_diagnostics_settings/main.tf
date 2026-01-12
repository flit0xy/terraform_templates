resource "azurerm_monitor_diagnostic_setting" "diagnostic_setting" {
  name                       = var.diagnostic_setting_name
  target_resource_id         = var.target_resource_id
  log_analytics_workspace_id = var.log_analytics_workspace_id

    dynamic "enabled_log" {
    for_each = var.enabled_log
    content {
      category = enabled_log.value.category
    }
  }

  dynamic "metric" {
    for_each = var.metric
    content {
      category = metric.value.category
      enabled  = metric.value.enabled
    }
  }
}