# infra\route_table\enterprise.tf

resource "aws_route_table" "enterprise_rt" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"  # Rota padrão para a internet
    network_interface_id = var.enterprise_eni_firewall_to_id
  }

  tags = {
    Name = "Enterprise Route Table"
  }
}

resource "aws_route_table_association" "enterprise_rta" {
  subnet_id      = var.enterprise_subnet_id
  route_table_id = aws_route_table.enterprise_rt.id
}