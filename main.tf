terraform {
   backend "gcs" {}
}


provider "google" {
 project = var.project-id 
 }




module "gce" {

  source = "git::https://github.com/lkaarnasre99/Terraform-Compute-Engine.git//modules/compute"
  instance_name   = var.instance_name
  project_id      = var.project_id
  region          = var.region
  zone            = var.zone
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

}



/*module "monitoring-alerts" {
   source = "./modules/monitoring"
   project_id = var.project_id
   region     = var.region

}*/
