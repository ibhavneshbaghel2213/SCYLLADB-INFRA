module "jenkins_ec2" {
source = "../../modules/ec2/private"
vpc_id=data.terraform_remote_state.network.outputs.vpc_id
private_subnet_id= data.terraform_remote_state.network.outputs.private_sub_ids
ami_id = var.ami_id
key_name = var.key_name
volume_size = var.volume_size
volume_type = var.volume_type
encrypted_volume = var.encrypted_volume
count_ec2_private = var.count_ec2_private
private_instance_type = var.private_instance_type
private_ec2_public_ip = var.private_ec2_public_ip
private_name = var.private_name
private_tags = var.private_tags
my_ip = data.http.ip.body
zone=var.zone
private_security_group_name =var.private_security_group_name 
iam_instance_profile = var.iam_instance_profile

 ingress_with_source_security_group_id = [
        {
      from_port                = 8080
      to_port                  = 8080
      protocol                 = "tcp"
      description              = "8080 port open of openvpn sg  name"
      source_security_group_id = data.terraform_remote_state.openvpn.outputs.openvpn_sg_id 
      
   },
  {
      from_port                = 9100
      to_port                  = 9100
      protocol                 = "tcp"
      description              = "9100 port of node exporter open for monitoring sg"
      source_security_group_id = data.terraform_remote_state.monitoring.outputs.monitoring_sg_id 
      
   },
    {
      from_port                = 22
      to_port                  = 22
      protocol                 = "tcp"
      description              = "22 port open of openvpn sg  name"
      source_security_group_id = data.terraform_remote_state.openvpn.outputs.openvpn_sg_id 
      
   },
  ]
  number_of_ingress_with_source_security_group_id = 3

   ingress_rules = [{
                    from_port   = 22,
                    to_port     = 22,
                    protocol    = "tcp",
                    cidr_blocks = [join("/", [data.terraform_remote_state.openvpn.outputs.public_ec2_ip, "32"])]
                  }]

    egress_rules = [{
                  from_port   = 0,
                  to_port     = 0,
                  protocol    = "-1",
                  cidr_blocks = ["0.0.0.0/0"]
                  }]
}


