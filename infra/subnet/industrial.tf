# infra\subnet\industrial.tf

resource "aws_subnet" "industrial_subnet" {
  vpc_id                  = var.vpc_id
  cidr_block              = "172.31.3.0/24"
  map_public_ip_on_launch = false # Sem IP público

  tags = {
    Name = "Industrial Subnet"
  }
}

output "industrial_subnet_id" {
  value = aws_subnet.industrial_subnet.id
}