output "public_ec2_sg_id" {
  description = "The sg id  for public ec2"
  value       = aws_security_group.public-security-group.id
}

output "public_ec2_ip" {
  description = "This is the public of ec2"
  value       = aws_instance.public_host.*.public_ip
}

output "private_ec2_ip" {
  description = "This is the private of ec2"
  value       = aws_instance.public_host.*.private_ip
}