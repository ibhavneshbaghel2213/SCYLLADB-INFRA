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

variable "instance_tenancy" {
  type        = string
  default     = "default"
  description = "instance tenancy"
}

variable "igw" {   
    type = string
    default = "igw"
    description = "create IGW"
}
