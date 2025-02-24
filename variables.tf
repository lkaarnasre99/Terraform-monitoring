# Project variables
variable "project_id_1" {
  description = "The GCP project ID -1 which is monitoring & monitored project"
  type        = string
}

variable "project_id_2" {
  description = "The GCP project ID -2 which is monitored project"
  type = string
}

variable "region" {
  description = "The region to deploy resources"
  type        = string
}

variable "zone" {
  description = "The zone to deploy resources"
  type        = string
}

# VM variables
variable "instance_name_1" {
  description = "The name of the VM instance-1 in project-1"
  type        = string
}

variable "instance_name_2 {
  description = "The name of the VM instance-2 in project-2"
  type = string
}

variable "machine_type" {
  description = "The machine type for the VM"
  type        = string
}

variable "boot_disk_image" {
  description = "The boot disk image to use"
  type        = string
}

variable "network" {
  description = "The network to attach the VM to"
  type        = string
  default     = "default"
}

variable "subnetwork" {
  description = "The subnetwork to attach the VM to"
  type        = string
  default     = "default"
}

variable "create_firewall_rules" {
  description = "Whether to create firewall rules"
  type        = bool
  default     = true
}

variable "additional_network_tags" {
  description = "Additional network tags to apply to the VM"
  type        = list(string)

}

variable "service_account_email" {
  description = "Service account email"
  type        = string
  default     = ""
}

variable "service_account_scopes" {
  description = "Service account scopes"
  type        = list(string)
  default     = ["cloud-platform"]
}

variable "install_lamp" {
  description = "Whether to install LAMP stack on the VM"
  type        = bool
  default     = false
}

variable "ssh_user" {
  description = "SSH username"
  type        = string
  default     = "admin"
}

variable "ssh_pub_key_file" {
  description = "Path to SSH public key file"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

variable "labels" {
  description = "Labels to apply to the VM"
  type        = map(string)
  default     = {}
}

