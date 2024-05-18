private_security_group_name = "scylla_sg"
zone                        = ["ap-south-1a", "ap-south-1b"]
rout-priv                   = "route-private"
ami_id                      = "ami-05e00961530ae1b55"
key_name                    = "scylla"
volume_size                 = 20
volume_type                 = "gp2"
encrypted_volume            = true
count_ec2_private           = 2
private_ec2_public_ip       = false
private_name                = "scylla"
private_instance_type       = "t2.xlarge"
tag_private_host_sg         = "scylla_sg"
private_tags                = { "node_exporter" = "true" }
subnet_cidr_priv            = ["10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24"]
region                      = "ap-south-1"
default_tags                = { ENV = "testing", created = "by terraform", Owner = "bhavnesh" }
