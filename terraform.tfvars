# Project settings
project_id = "qwiklabs-gcp-03-4e66da73d688"
region     = "us-west3"
zone       = "us-west3-b"

# VM settings
instance_name = "instance-1"
machine_type  = "e2-medium"
boot_disk_image = "debian-cloud/debian-12"
install_lamp = false

# Network settings
network    = "default"
subnetwork = "default"
create_firewall_rules = true
additional_network_tags = []

# SSH settings
ssh_user = "admin"
ssh_pub_key_file = "~/.ssh/id_rsa.pub"

# Labels
labels = {
  environment = "dev",
  app         = "instance-1"
}

