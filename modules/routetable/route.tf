resource "aws_route_table" "rout-pub" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.igw_id
  }

  tags = {
    Name = var.rout-pub
  }
}

resource "aws_route_table" "rout-priv" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.nat_id
  }

  tags = {
    Name = var.rout-priv
  }
}