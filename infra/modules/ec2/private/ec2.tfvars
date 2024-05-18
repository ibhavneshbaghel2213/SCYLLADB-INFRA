private_subnet_id = data.terraform_remote_state.network.output.private_sub_ids
ami_id = "ami-05e00961530ae1b55"
vpc_id = data.terraform_remote_state.network.output.vpc_id
