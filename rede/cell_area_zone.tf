provider "aws" {
  region = "us-east-1"  # Altere para a região adequada
}

resource "aws_subnet" "cell_area_zone_subnet" {
  vpc_id                  = "vpc-xxxxxxxx"  # Substitua pelo ID da sua VPC
  cidr_block              = "172.31.3.0/24"
  map_public_ip_on_launch = false  # Sem IP público para a zona industrial

  tags = {
    Name = "Cell Area Zone Subnet"
  }
}
