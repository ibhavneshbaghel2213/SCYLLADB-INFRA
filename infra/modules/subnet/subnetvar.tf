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

variable "vpc_id" {}

variable "zone" {   
    type = list(string)
    default = ["ap-south-1a","ap-south-1b"]
    description = "availibity zone"
}

variable route_pub_id {}

variable route_priv_id {}

