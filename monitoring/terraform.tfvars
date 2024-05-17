region="us-east-1"
default_tags={ ENV = "testing", created = "by terraform", Owner = "bhavnesh" }
zone=["us-east-1a","us-east-1b","us-east-1c"]
count_ec2_monitoring = 1
ami_id  = "ami-012127c6ce39ebd90" 
monitoring_instance_type  = "t2.medium"   
key_name = "monitoring"
private_ec2_public_ip = false
tag_monitoring_instance= "monitoring_host"
volume_size = 30
volume_type = "gp2"
encrypted_volume = true
private_security_group_name="monitoring-sg"
monitoring_name= "monitoring"
monitoring_tags = {"node_exporter" = "true" }
iam_instance_profile= "EC2"
