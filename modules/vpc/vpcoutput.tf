output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.terra-ninja-vpc-01.id
}

output "igw_id" {
  description = "The ID of the IGW"
  value       = aws_internet_gateway.igw.id
}

