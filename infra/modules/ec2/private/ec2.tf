
resource "aws_security_group" "private-security-group" {
  name = var.private_security_group_name
  description = "private sg "
  vpc_id = var.vpc_id
  tags = {
    Name = var.tag_private_host_sg
  }
  
  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port   = ingress.value["from_port"]
      to_port     = ingress.value["to_port"]
      protocol    = ingress.value["protocol"]
      cidr_blocks = ingress.value["cidr_blocks"]
     
    }
  }

  dynamic "egress" {
    for_each = var.egress_rules
    content {
      from_port   = egress.value["from_port"]
      to_port     = egress.value["to_port"]
      protocol    = egress.value["protocol"]
      cidr_blocks = egress.value["cidr_blocks"] 
    }
  }
}

# resource "aws_security_group_rule" "ingress_with_source_security_group_id" {
#   count = local.create ? var.number_of_ingress_with_source_security_group_id : 0

#   security_group_id = aws_security_group.private-security-group.id
#   type              = "ingress"
#   source_security_group_id = var.ingress_with_source_security_group_id[count.index]["source_security_group_id"]
  
#   description = lookup(
#     var.ingress_with_source_security_group_id[count.index],
#     "description",
#     "Ingress Rule",
#   )

#   from_port = lookup(
#     var.ingress_with_source_security_group_id[count.index],
#     "from_port",
   
#   )
#   to_port = lookup(
#     var.ingress_with_source_security_group_id[count.index],
#     "to_port",
#     )
#   protocol = lookup(
#     var.ingress_with_source_security_group_id[count.index],
#     "protocol",
#   )
# }
 
# resource "aws_instance" "private_host" {
#   count                       = var.count_ec2_private
#   ami                         = var.ami_id
#   instance_type               = var.private_instance_type
#   associate_public_ip_address = var.private_ec2_public_ip
#   key_name                    = var.key_name
#   iam_instance_profile        = var.iam_instance_profile != "" ? var.iam_instance_profile : null
#   availability_zone           = element(var.zone,count.index)
#   subnet_id                   = element(var.private_subnet_id,count.index)
#   vpc_security_group_ids      = [aws_security_group.private-security-group.id]
#   root_block_device {
#     volume_size = var.volume_size
#     volume_type = var.volume_type
#     encrypted   = var.encrypted_volume
#   }
#   tags = merge(
#     {
      
#       Name = format("%s","${var.private_name}-${count.index+1}")
#     },
#     var.private_tags,
#   )
# }

resource "aws_instance" "private_host" {
  count                       = var.count_ec2_private
  ami                         = var.ami_id
  instance_type               = var.private_instance_type
  # associate_public_ip_address = var.private_ec2_public_ip
  key_name                    = var.key_name
  # iam_instance_profile        = var.iam_instance_profile != "" ? var.iam_instance_profile : null
  availability_zone           = element(var.zone, count.index)
  subnet_id                   = element(var.private_subnet_id, count.index)
  # vpc_security_group_ids      = [aws_security_group.private-security-group.id]
  
  root_block_device {
    volume_size = var.volume_size
    volume_type = var.volume_type
    encrypted   = var.encrypted_volume
  }
  
  tags = merge(
    {
      Name = format("%s", "${var.private_name}-${count.index + 1}")
    },
    var.private_tags,
  )
}


resource "aws_key_pair" "privatekey" {
  count      = var.create_key_pair ? 1 : 0
  key_name   = var.key_name
  public_key = var.public_key
}

variable "create_key_pair" {
  description = "Whether to create the key pair"
  type        = bool
  default     = false
}

locals {
  create = var.create
}
