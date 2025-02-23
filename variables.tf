variable "project-id" {
  description = "The GCP project"
  type = string 

 }


variable "region" {
   description = "The region of resources"
   type = string

}

variable "zones" { 
   description = "The zone of resources"
   type = list(string) 

}


variable "instance-name" {
  description = "Instance names"
  type = list(string)
}


