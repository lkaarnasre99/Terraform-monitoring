# Project settings
project_id_1 = "qwiklabs-gcp-02-47d11ecedb53"
project_id_2 = "qwiklabs-gcp-02-4d49ad3802bb"


instance_name_1 = "instance-1"
instance_name_2 = "instance-2"

region-1     = "us-east1"
zone-1       = "us-east1-b"

region-2   = "us-east4"
zone-2    = "us-east4-b"

# VM settings
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
  app         = "instance-2"
}

