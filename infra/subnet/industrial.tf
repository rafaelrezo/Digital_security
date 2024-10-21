# infra\subnet\industrial.tf

resource "aws_subnet" "industrial_subnet" {
  vpc_id                  = var.vpc_id
  cidr_block              = "172.31.3.0/24"
  map_public_ip_on_launch = false # Sem IP público
  availability_zone       = "us-east-1c"
  tags = {
    Name = "Industrial Subnet"
  }
}

