
resource "aws_vpc" "terra-ninja-vpc-01" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = var.instance_tenancy
  tags = {
    Name = var.vpc_tag
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.terra-ninja-vpc-01.id

  tags = {
    Name = var.igw
  }
}