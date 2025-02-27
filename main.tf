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

//monitoring module
module "monitoring-alerts" {
   source = "./modules/monitoring"
   monitoring_project_id = var.project_id_1
   monitored_project_ids = [var.project_id_1, var.project_id_2] 
   providers = {
     google = google.project2
   }
  
}







