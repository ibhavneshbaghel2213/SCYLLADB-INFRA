output "scylla_sg_id" {
  description = "The ID of scylla SG"
  value       = module.scylla_ec2.private_ec2_sg_id
}

output "private_ec2_ip" {
  description = "This is the private of ec2"
  value       = module.scylla_ec2.*.private_ec2_ip
}