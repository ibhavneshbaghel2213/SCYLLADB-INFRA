module "ec2_monitoring" {
source = "../modules/ec2/private"
vpc_id=data.terraform_remote_state.network.outputs.vpc_id
private_subnet_id= data.terraform_remote_state.network.outputs.private_sub_ids
count_ec2_private = var.count_ec2_monitoring
ami_id = var.ami_id
private_instance_type = var.monitoring_instance_type
private_ec2_public_ip= var.private_ec2_public_ip
key_name = var.key_name
volume_size = var.volume_size
volume_type = var.volume_type
encrypted_volume = var.encrypted_volume
private_name = var.monitoring_name
private_tags = var.monitoring_tags
private_security_group_name = var.private_security_group_name
iam_instance_profile = var.iam_instance_profile
zone=var.zone
my_ip = data.http.ip.body

ingress_with_source_security_group_id = [
    {
      from_port                = 9090
      to_port                  = 9090
      protocol                 = "tcp"
      description              = "9090 prometheus port open of openvpn sg  name"
      source_security_group_id = data.terraform_remote_state.openvpn.outputs.openvpn_sg_id 
      
   },
   {
      from_port                = 22
      to_port                  = 22
      protocol                 = "tcp"
      description              = "22 port open of openvpn sg name"
      source_security_group_id = data.terraform_remote_state.openvpn.outputs.openvpn_sg_id 
      
   },
    {
      from_port                = 9093
      to_port                  = 9093
      protocol                 = "tcp"
      description              = "9093 alertmanager port open of openvpn sg  name"
      source_security_group_id = data.terraform_remote_state.openvpn.outputs.openvpn_sg_id 
      
   },
   {
      from_port                = 3000
      to_port                  = 3000
      protocol                 = "tcp"
      description              = "3000 grafna port open of openvpn sg  name"
      source_security_group_id = data.terraform_remote_state.openvpn.outputs.openvpn_sg_id 
      
   },
      {
      from_port                = 9100
      to_port                  = 9100
      protocol                 = "tcp"
      description              = "9100 node exporter port open of monitoring sg"
      source_security_group_id = module.ec2_monitoring.private_ec2_sg_id
      
   },
  ]
  number_of_ingress_with_source_security_group_id = 5



  ingress_rules = [
                  {
                    from_port   = 22,
                    to_port     = 22,
                    protocol    = "tcp",
                    cidr_blocks = [join("/", [data.terraform_remote_state.jenkins.outputs.private_ec2_ip, "32"])]
                  },
                   ]
    egress_rules = [{
                  from_port   = 0,
                  to_port     = 0,
                  protocol    = "-1",
                  cidr_blocks = ["0.0.0.0/0"]
                  }]
}
