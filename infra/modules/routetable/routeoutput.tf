output "public_rt_id" {
  description = "public subnet ids"
  value       = aws_route_table.rout-pub.id
}

output "private_rt_id" {
  description = "public subnet ids"
  value       = aws_route_table.rout-priv.id
}

