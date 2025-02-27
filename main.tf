terraform {
   backend "gcs" {}
}

provider "google" {
 alias = "project1"
 project = var.project_id_1
}

provider "google" {
 alias = "project2"
 project = var.project_id_2
}

// Monitoring module - Creating monitoring in P2 that monitors both P1 and P2
module "monitoring-alerts" {
   source = "./modules/monitoring"
   monitoring_project_id = var.project_id_2  // Changed to project_id_2 to create monitoring in P2
   monitored_project_ids = [var.project_id_1, var.project_id_2]
   providers = {
     google = google.project2  // Using the project2 provider
   }
}







