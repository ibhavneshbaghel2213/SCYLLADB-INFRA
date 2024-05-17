terraform {
  backend "s3" {
    bucket = "my-scylladb-new"
    key    = "my-scylladb-new/network.tfstate"
    region = "ap-south-1"
  }
}