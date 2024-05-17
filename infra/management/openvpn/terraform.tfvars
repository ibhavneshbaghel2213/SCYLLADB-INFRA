region="us-east-1"
default_tags={ ENV = "testing", created = "by terraform", Owner = "bhavnesh" }
zone=["us-east-1a","us-east-1b"]
security_group_name="openvpn_sg"
count_ec2_openvpn = 2
ami_id  = "ami-08d4ac5b634553e16" 
openvpn_instance_type  = "t2.medium"
public_ip = true 
key_name = "openvpn"
tag_openvpn_host_sg = "openvpn_hostg_sg"
tag_openvpn_instance= "openvpn_host"
volume_size = 20
volume_type = "gp2"
encrypted_volume = true
openvpn_name= "openvpn"
openvpn_tags = {"node_exporter" = "true", "openvpn" = "true" }
