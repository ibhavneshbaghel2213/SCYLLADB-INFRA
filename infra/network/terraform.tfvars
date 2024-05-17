region="us-east-1"
default_tags={ ENV = "testing", created = "by terraform", Owner = "bhavnesh" }
vpc_cidr="10.0.0.0/16"
vpc_tag="terra-ninja-vpc-01"
subnet_cidr-pub=["10.0.1.0/24","10.0.2.0/24"]
subnet_cidr-priv=["10.0.3.0/24","10.0.4.0/24","10.0.5.0/24"]
zone=["ap-south-1a","ap-south-1b","ap-south-1c"]
rout-pub="route-public"
rout-priv="route-private"