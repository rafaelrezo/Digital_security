# infra\main.tf

provider "aws" {
  region = "us-east-1"  # Defina a região conforme necessário
}


module "security_group" {
  source = "./security_group"

}

# module "route_table" {
#   source = "./route_table"
#   vpc_id = "vpc-035de6a04b60456dc"
#   enterprise_subnet_id = module.subnet.enterprise_subnet_id

# }

# module "subnet" {
#   source = "./subnet"
#   vpc_id = "vpc-035de6a04b60456dc"
# }
