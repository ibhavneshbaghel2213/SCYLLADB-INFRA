module "vpc" {
source = "../modules/vpc"
vpc_cidr = var.vpc_cidr
vpc_tag = var.vpc_tag
}

module "subnet" {
source = "../modules/subnet"
vpc_id = module.vpc.vpc_id  
subnet_cidr-pub = var.subnet_cidr-pub
subnet_cidr-priv = var.subnet_cidr-priv
zone = var.zone
route_pub_id = module.routetable.public_rt_id
route_priv_id = module.routetable.private_rt_id
}

module "routetable" {
source = "../modules/routetable"
vpc_id = module.vpc.vpc_id  
igw_id = module.vpc.igw_id
nat_id = module.nat.scylla_nat_id
rout-pub = var.rout-pub
rout-priv = var.rout-priv
}

module "nat" {
source = "../modules/nat"
pub_sub_id = module.subnet.public_sub_ids[0]
}