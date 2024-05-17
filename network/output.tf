output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "igw_id" {
  description = "The ID of the IGW"
  value       = module.vpc.igw_id
}

output "public_sub_ids" {
  description = "public subnet ids"
  value       = module.subnet.public_sub_ids
}

output "private_sub_ids" {
  description = "private subnet ids"
  value       = module.subnet.private_sub_ids 
}	

output "public_rt_id" {
  description = "public subnet ids"
  value       = module.routetable.public_rt_id
}

output "private_rt_id" {
  description = "public subnet ids"
  value       = module.routetable.private_rt_id
}

output "scylla_nat_id" {
  description = "scylla nat id"
  value       = module.nat.scylla_nat_id
}