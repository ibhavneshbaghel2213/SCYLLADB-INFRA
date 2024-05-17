output "scylla_nat_id" {
  description = "scylla nat id"
  value       = aws_nat_gateway.scylla_nat.id
}
