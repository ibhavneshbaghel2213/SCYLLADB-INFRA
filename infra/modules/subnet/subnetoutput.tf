output "public_sub_ids" {
  description = "public subnet ids"
  value       = aws_subnet.terra-final-pub-sub.*.id
}

output "private_sub_ids" {
  description = "private subnet ids"
  value       = aws_subnet.terra-final-priv-sub.*.id 
}	