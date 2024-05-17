data "http" "ip" {
  url = "https://ipinfo.io/ip"
}

provider "aws" {
  region = var.region
  default_tags {
    tags = var.default_tags
  }
}