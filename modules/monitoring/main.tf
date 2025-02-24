terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.0.0"  # adjust version as needed
    }
  }
}



# modules/monitoring/main.tf
resource "google_monitoring_group" "demo_group" {
  display_name = "DemoGroup"
  filter       = <<-EOT
    resource.type = "gce_instance" AND 
    resource.display_name=has_substring("instance") AND 
    (resource.project_id = "${join("\" OR resource.project_id = \"", var.monitored_project_ids)}")
  EOT
}

resource "google_monitoring_uptime_check_config" "demo_group_check" {
  display_name = "DemoGroup uptime check"
  timeout      = "60s"   # Default timeout
  period       = "60s"   # 1 minute check frequency

  tcp_check {
    port = 22
  }

  resource_group {
    group_id = google_monitoring_group.demo_group.name
  }

  selected_regions = [
    "USA",
    "EUROPE",
    "ASIA_PACIFIC"
  ]
}


resource "google_monitoring_alert_policy" "uptime_alert" {
  display_name = "Uptime Check Policy"
  enabled      = true
  combiner     = "OR"

  conditions {
    display_name = "Uptime health check on DemoGroup"
    
    condition_absent {
      filter = join(" AND ", [
        "metric.type = \"monitoring.googleapis.com/uptime_check/check_passed\"",
        "resource.type = \"gce_instance\"",
        "metric.label.check_id = \"${google_monitoring_uptime_check_config.demo_group_check.uptime_check_id}\""
      ])
      
      duration = "60s"
      
      trigger {
        count = 1
      }
    }
  }

  # Notifications turned off as per instructions
  notification_channels = []
}
