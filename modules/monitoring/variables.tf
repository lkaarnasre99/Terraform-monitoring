variable "monitoring-project-id" {
   description = "project where monitoring group will be created"
   type = string 
 }


variable "monitored-project-ids" {
  description = "projects monitored"
  type = list(string)
}




