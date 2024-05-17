
variable private_security_group_name {   
    type = string
    default = "private-sg"
    description = "private security group"
}

variable my_ip {}

variable "count_ec2_bastion" {   
    type = number
    default = 1
    description = "instance count"
}

variable "ami_id" {   
    type = string
    default = "ami-08d4ac5b634553e16"
    description = "ami id"
}

variable "bastion_instance_type" {   
    type = string
    default = "t2.micro"
    description = "instance type"
}

variable "public_ip" {   
    type = bool
    default = true
    description = "instance public ip"
}

variable "key_name" {   
    type = string
    default = "private"
    description = "instance key"
}

variable "tag_bastion_host_sg" {   
    type = string
    default = "bastion_host_sg"
    description = "bastion_host_security_group"
}

variable "tag_bastion_instance" {   
    type = string
    default = "bastion_host"
    description = "Create instance"
}

variable "volume_size" {   
    type = number
    default = 8
    description = "size"
}

variable "volume_type" {   
    type = string
    default = "gp2"
    description = "instance type"
}

variable "encrypted_volume" {   
    type = bool
    default = true
    description = "instance type"
}

variable "bastion_name" {   
    type = string
    default = "bastion"
    description = "name of bastion host"
}

variable "count_ec2_private" {   
    type = string
    default = "1"
    description = "instance count"
}

variable "private_ec2_public_ip" {   
    type = bool
    default = false
    description = "private instance public ip"
}

variable "private_name" {
  type        = string
  default     = "private"
  description = "private host"
}

variable "private_instance_type" {   
    type = string
    default = "t2.xlarge"
    description = "instance type private"
}

variable "tag_private_host_sg" {   
    type = string
    default = "tag_private_host_sg"
    description = "private host security group"
}

variable "private_host" {   
    type = string
    default = "private_host"
    description = "private host name"
}

variable "region" {   
    type = string
    default = "us-east-1"
    description = "availibility zone"
}
variable "zone" {   
    type = list(string)
    default = ["us-east-1a","us-east-1b"]
    description = "availibity zone"
}

variable private_subnet_id {}
variable vpc_id {}


variable "bastion_tags" {
  type        = map(string)
  description = "These are the additional tags associated with the main tag of bastion ec2"
  default = {}
}

variable "private_tags" {
  type        = map(string)
  description = "These are the additional tags associated with the main tag of private ec2"
  default = {  }
  
  }



variable subnet_cidr-priv {
  type        = list(string)
  default     = []
  description = "ingress cidr for private sg"
}

variable "iam_instance_profile" {
  type = string
  default = ""
}

variable "public_key" {
  type        = string
  description = "pem key for webapp instances"
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDkS2w+OWrKJ7T8hY4KuxB1u+Ny1MDhINEi4LEdSP9rmFC1eULPlZYIge8OLHvIbr0Dxhlx4UiESJohT38N0t0lgP2WN0I5ZmdcJTuPqYlW+6qvFb2011+T1TpgnMgSgseETDx4xGplmXHUmyAcAO/ZaTiRbCHdvqlc7rByoxFDp7cMh897lhLM9MKQmtiw+7xzEkk/JUJsRFnacslVNGFKg5dEnUYQa6LxazfWAM4OWja8LXOZMu6Ns4ge0pgV0d6E+eVAj+nzXtbirzFnubXxT8+gdiiND/Bm4NC3DhQ8UEsCQR/9HMvt0bRy/yzj5ARMNM9R6k3jvv6oChwi5H3jWnyw7MUsDJ5D00MLMQEAVPK8hcSekU4yX2Vro1iazNrk6vlIvYgZp4Mc8oSP+4G875Tiiwoc0k04MknE0IAHc69PiDtSjgG8F4oXrnJrExQnZ7g0i9SMtXZRYVoLhcM4uvEEa7bBa5ihVeIaFqFlKOYvoJ0VC+tnUvj/s0ucO1s= opstree@opstree-Latitude-3410"
}

variable "ingress_rules" {
  description = "ingress rule"
  type        = list(object({
                              from_port = number
                              to_port   = number
                              protocol  = string
                              cidr_blocks = list(string)
                                             }))
}

variable "egress_rules" {
  description = "egress rules with cidr_block"
  type        = list(object({
                              from_port   = number
                              to_port     = number
                              protocol    = string
                              cidr_blocks = list(string)
                              
                          }))
}

variable "ingress_with_source_security_group_id" {
  description = "List of computed ingress rules to create where 'source_security_group_id' is used"
  type        = list(map(string))
  default     = []
}

variable "number_of_ingress_with_source_security_group_id" {
  description = "Number of computed ingress rules to create where 'source_security_group_id' is used"
  type        = number
  default     = 0
}

variable "create" {
  description = "Whether to create security group and all rules"
  type        = bool
  default     = true
}