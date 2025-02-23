provider "google" {
     project = var.project_id
     region  = var.region 
}


module "instance" {
source = "git@github.com:lkaarnasre99/Terraform-Compute-Engine.git//modules/compute"

}
