variable "vpc_id" {}
variable "igw_id" {}
variable "nat_id" {}

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
