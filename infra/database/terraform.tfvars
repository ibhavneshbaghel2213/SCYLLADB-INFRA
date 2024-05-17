private_security_group_name = "scylla_sg"
zone                        = ["us-east-1a", "us-east-1b", "us-east-1c"]
rout-priv                   = "route-private"
ami_id                      = "ami-0e001c9271cf7f3b9"
key_name                    = "scylla"
volume_size                 = 20
volume_type                 = "gp2"
encrypted_volume            = true
count_ec2_private           = 3
private_ec2_public_ip       = false
private_name                = "scylla"
private_instance_type       = "t2.xlarge"
tag_private_host_sg         = "scylla_sg"
private_tags                = { "node_exporter" = "true" }
subnet_cidr_priv            = ["10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24"]
region                      = "us-east-1"
default_tags                = { ENV = "testing", created = "by terraform", Owner = "bhavnesh" }
