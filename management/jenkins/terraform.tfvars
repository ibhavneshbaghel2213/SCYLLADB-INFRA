private_security_group_name= "jenkins_sg"
zone=["us-east-1a","us-east-1b","us-east-1c"]
rout-priv= "route-private"
key_name= "jenkins"
volume_size = 30
volume_type = "gp2"
encrypted_volume = true
count_ec2_private = 1
private_ec2_public_ip = false
private_name = "jenkins"
private_instance_type= "t2.medium"
tag_private_host_sg = "jenkins_sg"
private_host= "private_host"
private_tags= {"node_exporter" = "true", "private" = "true" }
region="us-east-1"
default_tags={ ENV = "testing", created = "by terraform", Owner = "bhavnesh" }
ami_id  = "ami-01e9e0b4fe83040cc" 
iam_instance_profile= "fullacces_jenkinsrole"