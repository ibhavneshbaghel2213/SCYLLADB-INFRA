terraform {
  backend "s3" {
    bucket = "final-assessment"
    key    = "env/final-assessment/monitoring.tfstate"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "final-assessment"
    key    = "env/final-assessment/network.tfstate"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "jenkins" {
  backend = "s3"
  config = {
    bucket = "final-assessment"
    key    = "env/final-assessment/jenkins.tfstate"
    region = "us-east-1"
  }
}
data "terraform_remote_state" "openvpn" {
  backend = "s3"
  config = {
    bucket = "final-assessment"
    key    = "env/final-assessment/openvpn.tfstate"
    region = "us-east-1"
  }
}
