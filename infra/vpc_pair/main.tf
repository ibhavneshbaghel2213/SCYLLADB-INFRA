resource "aws_vpc_peering_connection" "vpc_peering" {
  vpc_id        = var.vpc_id_1
  peer_vpc_id   = data.terraform_remote_state.network.outputs.vpc_id
  auto_accept   = true
}

resource "aws_route" "route_to_vpc_2" {
  route_table_id            = rtb-08fe8d2504f25eba2
  destination_cidr_block    = data.terraform_remote_state.network.outputs.vpc_cider
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peering.id
}

resource "aws_route" "route_to_vpc_1" {
  route_table_id            = data.terraform_remote_state.network.outputs.private_rt_id
  destination_cidr_block    = var.cidr_block_vpc_1
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peering.id
}

resource "aws_security_group_rule" "allow_jenkins_access" {
  type              = "ingress"
  from_port         = var.jenkins_port
  to_port           = var.jenkins_port
  protocol          = "tcp"
  cidr_blocks       = [var.cidr_block_vpc_2]
  security_group_id = var.jenkins_sg_id
}
