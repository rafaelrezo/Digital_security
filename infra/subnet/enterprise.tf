# infra/subnet/enterprise.tf

resource "aws_subnet" "enterprise_subnet" {
  vpc_id                  = var.vpc_id
  cidr_block              = "172.31.1.0/24"
  map_public_ip_on_launch = true # Mapear IP Público no início
  availability_zone       = "us-east-1c"

  tags = {
    Name = "Enterprise Subnet"
  }
}