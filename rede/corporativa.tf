provider "aws" {
  region = "us-east-1"  # Altere para a região adequada
}

resource "aws_subnet" "corporativa_subnet" {
  vpc_id                  = "vpc-xxxxxxxx"  # Substitua pelo ID da sua VPC
  cidr_block              = "172.31.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "Corporativa Subnet"
  }
}
