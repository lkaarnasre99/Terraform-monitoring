variable "monitoring_project_id" {
   description = "project where monitoring group will be created"
   type = string 
 }


variable "monitored_project_ids" {
  description = "projects monitored"
  type = list(string)
}




