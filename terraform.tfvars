# Project settings
project_id_1 = "playground-s-11-3b55ad7a"
project_id_2 = ""
instance_name_1 = "instance-1"
instance_name_2 = "instance-2"

region     = "us-central1"
zone       = "us-central1-a"

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

