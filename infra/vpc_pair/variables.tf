variable "region" {
  description = "The AWS region to create resources in"
  type        = string
  default     = "ap-south-1"
}

variable "vpc_id_1" {
  description = "The ID of the first VPC (where Jenkins server is running)"
  type        = string
  default = "vpc-01f315d02ab718a34"
}

# variable "vpc_id_2" {
#   description = "The ID of the second VPC"
#   type        = string
#   default = 
# }

variable "cidr_block_vpc_1" {
  description = "The CIDR block of the first VPC"
  type        = string
  default = "172.31.0.0/16"
}

variable "cidr_block_vpc_2" {
  description = "The CIDR block of the second VPC"
  type        = string
  default = "10.0.0.0/16"
}

variable "jenkins_sg_id" {
  description = "The Security Group ID of the Jenkins server"
  type        = string
  default = sg-082eaa4bcc918b339
}

variable "jenkins_port" {
  description = "The port on which Jenkins is running"
  type        = number
  default     = 8080
}
