output "monitoring_group_id" {
  description = "The ID of the monitoring group"
  value       = module.monitoring-alerts.monitoring_group_id
}

output "uptime_check_id" {
  description = "The ID of the uptime check"
  value       = module.monitoring-alerts.uptime_check_id
}

output "alert_policy_id" {
  description = "The ID of the alert policy"
  value       = module.monitoring-alerts.alert_policy_id
}