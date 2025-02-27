terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.0.0"
    }
  }
}

# Set up metric scope - allow monitoring_project_id to access metrics from all monitored projects
resource "google_monitoring_metric_scope" "project_scope" {
  for_each = toset([for id in var.monitored_project_ids : id if id != var.monitoring_project_id])
  
  scoping_project = var.monitoring_project_id
  monitored_project = each.value
}

# Create the monitoring group in P2
resource "google_monitoring_group" "demo_group" {
  display_name = "DemoGroup"
  filter       = "resource.type = \"gce_instance\""
  project      = var.monitoring_project_id
}

# Create uptime check for TCP port 22 on instances in the monitoring group
resource "google_monitoring_uptime_check_config" "demo_group_check" {
  display_name = "DemoGroup uptime check"
  project      = var.monitoring_project_id
  timeout      = "60s"
  period       = "300s"  # 5 minute check frequency

  tcp_check {
    port = 22
  }

  resource_group {
    group_id = google_monitoring_group.demo_group.id
    resource_type = "INSTANCE"
  }

  selected_regions = [
    "USA",
    "EUROPE"
  ]
}

# Create alert policy based on the uptime check
resource "google_monitoring_alert_policy" "uptime_alert" {
  display_name = "Uptime Check Policy"
  project      = var.monitoring_project_id
  enabled      = true
  combiner     = "OR"

  conditions {
    display_name = "SSH Port 22 Unavailable"
    
    condition_absent {
      filter = join(" AND ", [
        "metric.type = \"monitoring.googleapis.com/uptime_check/check_passed\"",
        "resource.type = \"gce_instance\"",
        "metric.label.check_id = \"${google_monitoring_uptime_check_config.demo_group_check.uptime_check_id}\""
      ])
      
      duration = "300s"
      
      trigger {
        count = 1
      }
    }
  }

  # Notification channels would be added here
  # notification_channels = []
  
  documentation {
    content = "SSH Port 22 is not responding on one or more instances in the monitoring group."
    mime_type = "text/markdown"
  }
}