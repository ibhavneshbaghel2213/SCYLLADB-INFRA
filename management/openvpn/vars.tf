################################### ec2 #######################################################

variable "zone" {   
    type = list(string)
    default = ["us-east-1a","us-east-1b"]
    description = "availibity zone"
}

variable "count_ec2_openvpn" {   
    type = number
    default = 1
    description = "instance count"
}

variable "ami_id" {   
    type = string
    default = "ami-08d4ac5b634553e16"
    description = "ami id"
}

variable "openvpn_instance_type" {   
    type = string
    default = "t2.medium"
    description = "instance type"
}

variable "public_ip" {   
    type = bool
    default = true
    description = "instance public ip"
}

variable "key_name" {   
    type = string
    default = "redis"
    description = "instance key"
}

variable "tag_openvpn_host_sg" {   
    type = string
    default = "openvpn_host_sg"
    description = "openvpn_host_security_group"
}

variable "tag_openvpn_instance" {   
    type = string
    default = "openvpn_host"
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

variable "openvpn_name" {   
    type = string
    default = "openvpn"
    description = "name of openvpn host"
}

variable "openvpn_tags" {
  type        = map(string)
  description = "These are the additional tags associated with the main tag of openvpn ec2"
  default = {"node_exporter" = "true", "openvpn" = "true"}
}



################################# Security Group ##########################################

variable security_group_name {   
    type = string
    default = "openvpn_sg"
    description = "openvpn_host_security_group"
}

variable "iam_instance_profile" {
  type = string
  default = "fullacces_openvpnrole "
}

################################### provider ################################################

variable "region" {   
    type = string
    default = "us-east-1"
    description = "vpc region"
}

variable "default_tags" {   
    type = map
    default = { ENV = "testing", created = "by terraform", Owner = "bhavnesh" }
    description = "default tags"
}
####################for ingress allow for sg #########################
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
  default     = false
}

