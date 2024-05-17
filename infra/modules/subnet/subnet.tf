resource "aws_subnet" "terra-final-pub-sub" {
  vpc_id = var.vpc_id
  cidr_block = element(var.subnet_cidr-pub,count.index)
  count = length(var.subnet_cidr-pub)
  availability_zone = element(var.zone,count.index)
  tags = {
    Name = "public_subnet_${count.index+1}"
  }
}

resource "aws_subnet" "terra-final-priv-sub" {
  vpc_id = var.vpc_id
  cidr_block = element(var.subnet_cidr-priv,count.index)
  count = length(var.subnet_cidr-priv)
  availability_zone = element(var.zone,count.index)
  tags = {
    Name = "private_subnet-${count.index+1}"
  }
}

resource "aws_route_table_association" "associate-pub" {
  count = length(aws_subnet.terra-final-pub-sub.*.id)
  subnet_id = element(aws_subnet.terra-final-pub-sub.*.id,count.index)
  route_table_id = var.route_pub_id
}

resource "aws_route_table_association" "associate-priv" {
  count = length(aws_subnet.terra-final-priv-sub.*.id) 
  subnet_id = element(aws_subnet.terra-final-priv-sub.*.id,count.index)
  route_table_id = var.route_priv_id
}
