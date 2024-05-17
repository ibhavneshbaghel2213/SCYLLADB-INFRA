terraform {
  backend "s3" {
    bucket = "my-tool-scylladb-new"
    key    = "my-tool-scylla-new/network.tfstate"
    region = "ap-south-1"
  }
}