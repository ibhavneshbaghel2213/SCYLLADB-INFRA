resource "aws_eip" "nat_ip" {
  domain = "vpc"
}


resource "aws_nat_gateway" "scylla_nat" {                         ## nat gatway
  allocation_id = aws_eip.nat_ip.id
  subnet_id     = var.pub_sub_id
  tags = {
    Name = "nat_gateway"
  }
}