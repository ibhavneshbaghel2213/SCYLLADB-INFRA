
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
    default = "ami-05e00961530ae1b55"
    description = "ami id"
}

variable "bastion_instance_type" {   
    type = string
    default = "t2.xlarge"
    description = "instance type"
}

variable "public_ip" {   
    type = bool
    default = true
    description = "instance public ip"
}

variable "key_name" {   
    type = string
    default = "myserver"
    description = "scylla pem key"
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
    default = 20
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
    default = "ap-south-1"
    description = "availibility zone"
}
variable "zone" {   
    type = list(string)
    default = ["ap-south-1a","ap-south-1b"]
    description = "availibity zone"
}

variable "private_subnet_id" {
  description = "private subnet of vpc"
  default = ""
}

variable "vpc_id" {
  default = ""
}


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
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDWxRpsKMwRBhYL77lMDQycibmqHuA0vm/bOsEVFKcbqDgZqAspTDCDVB9+mMeYDO9t9L+p5APNW1t72f1fje/+DSVfICtSqgCtq6u6TyhzDXI5pjN8qZc9NcSXQ7mTEIn7GtcGYHmCyEseXmwjN2DtznlKBUH4COC3+9SU9gRu9kb5Jjba0tdvqRDMoDGOEVj6YKkEhYJTgTOm/i/Po2SfPAVy3zP1JvADqn4Xlodq4ClLeBg1U9Q/Glz487zvGJofBhrQ0DWyN5qV/tqq+XgWcFCOi+K9H78bX6dcF3eSsx5NmzPlYTwMB4dFfUPmThEoHnAhvMor0ELd4tqTZaNnR2aFxeSQHZG9hyLq+FNOFgj0hCXJjWarrwuiq8n+3XVN2Ronte6vhJfTbhCzeZkM8KCTFhExfIUxHUq2CW/tbn8oLN8gyacD1N1cS/vvPe63O9MsVFwCczCEGwu0MJ07eXBXTKzDi7cG7sUYr1CiGJ5jzPj9D+bGI7bN0SdVktM= bhavnesh@Ninja"
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