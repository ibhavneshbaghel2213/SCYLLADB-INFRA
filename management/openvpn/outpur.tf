output "openvpn_sg_id" {
  description = "The ID of openvpn SG"
  value       = module.openvpn_ec2.public_ec2_sg_id
}

output "public_ec2_ip" {
  description = "This is the public of ec2"
  value       = module.openvpn_ec2.public_ec2_ip[0]
}

output "private_ec2_ip" {
  description = "This is the private of ec2"
  value       = module.openvpn_ec2.private_ec2_ip[0]
}
