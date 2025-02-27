output "monitoring_group_id" {
  description = "The ID of the monitoring group"
  value       = google_monitoring_group.demo_group.id
}

output "uptime_check_id" {
  description = "The ID of the uptime check"
  value       = google_monitoring_uptime_check_config.demo_group_check.uptime_check_id
}

output "alert_policy_id" {
  description = "The ID of the alert policy"
  value       = google_monitoring_alert_policy.uptime_alert.id
}

output "monitored_projects" {
  description = "The configured monitored projects"
  value       = {for k, v in google_monitoring_monitored_project.project_scope : k => v.name}
}