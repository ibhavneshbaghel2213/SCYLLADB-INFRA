################################### ec2 #######################################################

variable "zone" {   
    type = list(string)
    default = ["us-east-1a","us-east-1b"]
    description = "availibity zone"
}

variable "count_ec2_monitoring" {   
    type = number
    default = 1
    description = "instance count"
}

variable "ami_id" {   
    type = string
    default = "ami-012127c6ce39ebd90"
    description = "ami id"
}

variable "monitoring_instance_type" {   
    type = string
    default = "t2.medium"
    description = "instance type"
}

variable "private_ec2_public_ip" {   
    type = bool
    default = false
    description = "instance public ip"
}

variable "key_name" {   
    type = string
    default = "redis"
    description = "instance key"
}

variable "private_security_group_name" {   
    type = string
    default = "monitoring_sg"
    description = "monitoring_host_security_group"
}

variable "tag_monitoring_instance" {   
    type = string
    default = "monitoring_host"
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

variable "monitoring_name" {   
    type = string
    default = "monitoring"
    description = "name of monitoring host"
}

variable "monitoring_tags" {
  type        = map(string)
  description = "These are the additional tags associated with the main tag of monitoring ec2"
  default = {"node_exporter" = "true", "monitoring" = "true"}
}



################################# Security Group ##########################################


variable "iam_instance_profile" {
  type = string
  default = "fullacces_monitoringrole "
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
  default     = true
}
