# infra\route_table\enterprise.tf

resource "aws_route_table" "enterprise_rt" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"  # Rota padrão para a internet
    gateway_id = "igw-xxxxxxxx"  # Substitua pelo ID do Internet Gateway
  }

  tags = {
    Name = "Corporativa Route Table"
  }
}

resource "aws_route_table_association" "enterprise_rta" {
  subnet_id      = var.enterprise_subnet_id
  route_table_id = aws_route_table.corporativa_rt.id
}
