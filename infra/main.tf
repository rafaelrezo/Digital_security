# infra\main.tf

provider "aws" {
  region = "us-east-1"  # Defina a região conforme necessário
}


module "security_group" {
  source          = "./security_group"
  vpc_id          = "vpc-035de6a04b60456dc"
  enterprise_cidr = "172.31.1.0/24"
  idmz_cidr       = "172.31.2.0/24"
  industrial_cidr = "172.31.3.0/24"
}

module "subnet" {
  source          = "./subnet"
  vpc_id          = "vpc-035de6a04b60456dc"
}

# AWS reserva os endereços
# .1: Reserved by AWS for the VPC router
# .2: Reserved by AWS. The IP address of the DNS
# .3: Reserved by AWS for future use
# .255: Network broadcast address.

module "interface" {
  source                     = "./interface"
  enterprise_subnet_id       = module.subnet.enterprise_subnet_id
  idmz_subnet_id             = module.subnet.idmz_subnet_id
  industrial_subnet_id       = module.subnet.industrial_subnet_id
  enterprise_default_gateway = "172.31.1.4"
  idmz_default_gateway       = "172.31.2.4"
  industrial_default_gateway = "172.31.3.4"
  enterprise_sg_id           = module.security_group.enterprise_sg_id
  idmz_sg_id                 = module.security_group.idmz_sg_id
  industrial_sg_id           = module.security_group.industrial_sg_id
}


module "route_table" {
  source                        = "./route_table"
  vpc_id                        = "vpc-035de6a04b60456dc"
  enterprise_eni_firewall_to_id = module.interface.enterprise_eni_firewall_to_id
  idmz_eni_firewall_to_id       = module.interface.idmz_eni_firewall_to_id
  industrial_eni_firewall_to_id = module.interface.industrial_eni_firewall_to_id
  enterprise_subnet_id          = module.subnet.enterprise_subnet_id
  idmz_subnet_id                = module.subnet.idmz_subnet_id
  industrial_subnet_id          = module.subnet.industrial_subnet_id
}

module "firewall" {
  source                        = "./firewall"
  ami                           = "ami-0e86e20dae9224db8"
  instance_type                 = "m5a.large"
  key_name                      = "firewall-to"
  user_data                     = "firewall\\to-install.sh"
  enterprise_eni_firewall_to_id = module.interface.enterprise_eni_firewall_to_id
  idmz_eni_firewall_to_id       = module.interface.idmz_eni_firewall_to_id
  industrial_eni_firewall_to_id = module.interface.industrial_eni_firewall_to_id
}

module "service" {
  source                        = "./service"
  idmz_subnet_id                = module.subnet.idmz_subnet_id
  industrial_subnet_id          = module.subnet.industrial_subnet_id
  idmz_sg_id                    = module.security_group.idmz_sg_id
  industrial_sg_id              = module.security_group.industrial_sg_id
}
