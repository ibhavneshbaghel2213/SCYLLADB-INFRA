terraform {
  backend "s3" {
    bucket = "my-tool-scylladb"
    key    = "my-tool-scylladb/scylla.tfstate"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "my-tool-scylladb"
    key    = "my-tool-scylladb/network.tfstate"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "monitoring" {
  backend = "s3"
  config = {
    bucket = "my-tool-scylladb"
    key    = "my-tool-scylladb/monitoring.tfstate"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "openvpn" {
  backend = "s3"
  config = {
    bucket = "my-tool-scylladb"
    key    = "my-tool-scylladb/openvpn.tfstate"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "jenkins" {
  backend = "s3"
  config = {
    bucket = "my-tool-scylladb"
    key    = "my-tool-scylladb/jenkins.tfstate"
    region = "us-east-1"
  }
}