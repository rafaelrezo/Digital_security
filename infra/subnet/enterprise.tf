# infra/subnet/enterprise.tf

resource "aws_subnet" "enterprise_subnet" {
  vpc_id                  = var.vpc_id
  cidr_block              = "172.31.1.0/24"
  map_public_ip_on_launch = true # com IP público

  tags = {
    Name = "Corporativa Subnet"
  }
}

output "enterprise_subnet_id" {
  value = aws_subnet.enterprise_subnet.id
}