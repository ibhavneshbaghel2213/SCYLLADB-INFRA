terraform {
  backend "s3" {
    bucket = "my-scylladb-new"
    key    = "my-scylladb-new/vpcPairing.tfstate"
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

