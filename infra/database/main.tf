module "scylla_ec2" {
  source                    = "../modules/ec2/private"
  vpc_id                    = data.terraform_remote_state.network.outputs.vpc_id
  private_subnet_id         = data.terraform_remote_state.network.outputs.private_sub_ids
  ami_id                    = var.ami_id
  key_name                  = var.key_name
  volume_size               = var.volume_size
  volume_type               = var.volume_type
  encrypted_volume          = var.encrypted_volume
  count_ec2_private         = var.count_ec2_private
  private_instance_type     = var.private_instance_type
  private_ec2_public_ip     = var.private_ec2_public_ip
  private_name              = var.private_name
  private_tags              = var.private_tags
  my_ip                     = data.http.ip.body
  zone                      = var.zone
  private_security_group_name = var.private_security_group_name

  ingress_with_source_security_group_id = [
    {
      from_port                = 22
      to_port                  = 22
      protocol                 = "tcp"
      description              = "22 port open for Jenkins SG"
      source_security_group_id = "sg-082eaa4bcc918b339"
    },
    {
      from_port                = 7000
      to_port                  = 7000
      protocol                 = "tcp"
      description              = "7000 port for internode communication (non-SSL)"
      source_security_group_id = "sg-082eaa4bcc918b339"
    },
    {
      from_port                = 7001
      to_port                  = 7001
      protocol                 = "tcp"
      description              = "7001 port for internode communication (SSL)"
      source_security_group_id = "sg-082eaa4bcc918b339"
    },
    {
      from_port                = 9042
      to_port                  = 9042
      protocol                 = "tcp"
      description              = "9042 port for CQL client connections"
      source_security_group_id = "sg-082eaa4bcc918b339"
    },
    # {
    #   from_port                = 9180
    #   to_port                  = 9180
    #   protocol                 = "tcp"
    #   description              = "9180 port for Scylla Manager REST API"
    #   source_security_group_id = data.terraform_remote_state.monitoring.outputs.monitoring_sg_id
    # },
    # {
    #   from_port                = 9183
    #   to_port                  = 9183
    #   protocol                 = "tcp"
    #   description              = "9183 port for Scylla Monitoring (Prometheus metrics)"
    #   source_security_group_id = data.terraform_remote_state.monitoring.outputs.monitoring_sg_id
    # },
    {
      from_port                = 7199
      to_port                  = 7199
      protocol                 = "tcp"
      description              = "7199 port for JMX monitoring"
      source_security_group_id = "sg-082eaa4bcc918b339"
    }
  ]
  number_of_ingress_with_source_security_group_id = 9
  ingress_rules = []
  # ingress_rules = [
  #   {
  #     from_port   = 22
  #     to_port     = 22
  #     protocol    = "tcp"
  #     cidr_blocks = [join("/", [data.terraform_remote_state.jenkins.outputs.private_ec2_ip, "32"])]
  #   },
  #   {
  #     from_port   = 6379
  #     to_port     = 6379
  #     protocol    = "tcp"
  #     cidr_blocks = var.subnet_cidr_priv
  #   },
  #   {
  #     from_port   = 16379
  #     to_port     = 16379
  #     protocol    = "tcp"
  #     cidr_blocks = var.subnet_cidr_priv
  #   }
  # ]

  egress_rules = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}
