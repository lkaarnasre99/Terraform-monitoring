terraform {
   backend "gcs" {}
}


provider "google" {
 project = var.project-id 
 }


module "monitoring-alerts" {
   source = "./modules/monitoring"
  
}
