terraform {
  backend "s3" {
    bucket = "my-tool-scylladb"
    key    = "my-tool-scylla/network.tfstate"
    region = "us-east-1"
  }
}