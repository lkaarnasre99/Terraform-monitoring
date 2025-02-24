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


module "gce-project1" {

  source = "git::https://github.com/lkaarnasre99/Terraform-Compute-Engine.git//modules/compute"
  instance_name   = var.instance_name_1
  project_id      = var.project_id_1
  region          = var.region-1
  zone            = var.zone-1
  machine_type    = var.machine_type
  boot_disk_image = var.boot_disk_image
  install_lamp    = var.install_lamp
  
  network    = var.network
  subnetwork = var.subnetwork
  
  create_firewall_rules  = var.create_firewall_rules
  additional_network_tags = var.additional_network_tags
  
  service_account_email  = var.service_account_email
  service_account_scopes = var.service_account_scopes
  
  labels    = var.labels
  ssh_user  = var.ssh_user
  ssh_pub_key_file = var.ssh_pub_key_file

  providers = {
    google = google.project1  
  }

}


/*module "gce-project2" {

source = "git::https://github.com/lkaarnasre99/Terraform-Compute-Engine.git//modules/compute"

  instance_name   = var.instance_name_2
  project_id      = var.project_id_2
  region          = var.region-2
  zone            = var.zone-2
  machine_type    = var.machine_type
  boot_disk_image = var.boot_disk_image
  install_lamp    = var.install_lamp
  
  network    = var.network
  subnetwork = var.subnetwork
  
  create_firewall_rules  = var.create_firewall_rules
  additional_network_tags = var.additional_network_tags
  
  service_account_email  = var.service_account_email
  service_account_scopes = var.service_account_scopes
  
  labels    = var.labels
  ssh_user  = var.ssh_user
  ssh_pub_key_file = var.ssh_pub_key_file

  providers = {
    google = google.project2  
  } 
}*/




module "monitoring-alerts" {
   source = "./modules/monitoring"
   monitoring_project_id = var.project_id_1
   monitored_project_ids = [var.project_id_1, var.project_id_2] 
   providers = {
     google = google.project1 
   }
  
}
