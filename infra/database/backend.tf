terraform {
  backend "s3" {
    bucket = "my-scylladb-new"
    key    = "my-scylladb-new/scylla.tfstate"
    region = "ap-south-1"
  }
}

data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "my-scylladb-new"
    key    = "my-scylladb-new/network.tfstate"
    region = "ap-south-1"
  }
}

# data "terraform_remote_state" "monitoring" {
#   backend = "s3"
#   config = {
#     bucket = "my-scylladb-new"
#     key    = "my-scylladb-new/monitoring.tfstate"
#     region = "ap-south-1"
#   }
# }

# data "terraform_remote_state" "openvpn" {
#   backend = "s3"
#   config = {
#     bucket = "my-scylladb-new"
#     key    = "my-scylladb-new/openvpn.tfstate"
#     region = "ap-south-1"
#   }
# }

# data "terraform_remote_state" "jenkins" {
#   backend = "s3"
#   config = {
#     bucket = "my-scylladb-new"
#     key    = "my-scylladb-new/jenkins.tfstate"
#     region = "ap-south-1"
#   }
# }