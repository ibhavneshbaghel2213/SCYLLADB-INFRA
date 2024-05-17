module "openvpn_ec2" {
source = "../../modules/ec2/public"
vpc_id= data.terraform_remote_state.network.outputs.vpc_id
public_subnet_id= data.terraform_remote_state.network.outputs.public_sub_ids
count_ec2_public = var.count_ec2_openvpn
ami_id = var.ami_id
public_instance_type = var.openvpn_instance_type
public_ip = var.public_ip
key_name = var.key_name
volume_size = var.volume_size
volume_type = var.volume_type
encrypted_volume = var.encrypted_volume
public_name = var.openvpn_name
public_tags = var.openvpn_tags
tag_public_host_sg = var.tag_openvpn_host_sg
zone=var.zone
security_group_name=var.security_group_name
  ingress_rules = [{
                    from_port   = 22,
                    to_port     = 22,
                    protocol    = "tcp",
                    cidr_blocks = [join("/", [data.http.ip.body, "32"])]
                  },
                  {
                    from_port   = 1194,
                    to_port     = 1194,
                    protocol    = "udp",
                    cidr_blocks = ["0.0.0.0/0"]
                  }]
    egress_rules = [{
                  from_port   = 0,
                  to_port     = 0,
                  protocol    = "-1",
                  cidr_blocks = ["0.0.0.0/0"]
                  }]
}
