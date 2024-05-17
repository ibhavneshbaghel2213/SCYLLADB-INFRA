###################################### Region ##########################################

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

variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "vpc cidr"
}

variable "vpc_tag" {
  type        = string
  default     = "terra-ninja-vpc-01"
  description = "vpc name"
}

##################################subnet vars###################################################
variable "subnet_cidr-pub" {
    type = list(string)
    default = ["10.0.1.0/24","10.0.2.0/24"]
    description = "cidr for subnet pulic"
}

variable "subnet_cidr-priv" {
    type = list(string)
    default = ["10.0.3.0/24","10.0.4.0/24"]
    description = "cidr for subnet private"
}

variable "zone" {   
    type = list(string)
    default = ["ap-south-1a","ap-south-1b"]
    description = "availibity zone"
}

##################################route vars###################################################


variable "rout-pub" {   
    type = string
    default = "route-public"
    description = "public route table name"
}

variable "rout-priv" {   
    type = string
    default = "route-private"
    description = "private route table name"
}
