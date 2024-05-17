output "monitoring_sg_id" {
  description = "The ID of monitoring SG"
  value       = module.ec2_monitoring.private_ec2_sg_id
}


output "private_ec2_ip" {
  description = "This is the private of ec2"
  value       = module.ec2_monitoring.private_ec2_ip[0]
}