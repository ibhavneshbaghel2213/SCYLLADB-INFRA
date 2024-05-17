output "private_ec2_sg_id" {
  description = "The sg id  for private ec2"
  value       = aws_security_group.private-security-group.id
}

output "private_ec2_ip" {
  description = "This is the private of ec2"
  value       = aws_instance.private_host.*. private_ip
}

