# infra\subnet\idmz.tf

resource "aws_subnet" "idmz_subnet" {
  vpc_id                  = var.vpc_id
  cidr_block              = "172.31.2.0/24"
  map_public_ip_on_launch = false # Sem IP público

  tags = {
    Name = "IDMZ Subnet"
  }
}

output "idmz_subnet_id" {
  value = aws_subnet.idmz_subnet.id
}