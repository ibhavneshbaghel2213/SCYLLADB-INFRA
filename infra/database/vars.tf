
variable private_security_group_name {   
    type = string
    default = "scylla_sg"
    description = "scylla sg name"
}

##################################subnet vars###################################################

variable "zone" {   
    type = list(string)
    default = ["ap-south-1a","ap-south-1b"]
    description = "availibity zone"
}


##################################route vars###################################################

variable "rout-priv" {   
    type = string
    default = "route-private"
    description = "private route table name"
}

################################### ec2 #######################################################


variable "ami_id" {   
    type = string
    default = "ami-05e00961530ae1b55"
    description = "ami id"
}

variable "key_name" {   
    type = string
    default = "scylla"
    description = "instance key"
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

variable "count_ec2_private" {   
    type = string
    default = "3"
    description = "instance count"
}

variable "private_ec2_public_ip" {   
    type = bool
    default = false
    description = "private instance public ip"
}


variable "private_name" {
  type        = string
  default     = "scylla"
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



variable "private_tags" {
  type        = map(string)
  description = "These are the additional tags associated with the main tag of private ec2"
  default = {"node_exporter" = "true" }
  
  }

variable "subnet_cidr_priv" {
    type = list(string)
    default = ["10.0.3.0/24","10.0.4.0/24"]
    description = "cidr for subnet private"
}

  ################################### provider ################################################

variable "region" {   
    type = string
    default = "ap-south-1"
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
  default     = true
}