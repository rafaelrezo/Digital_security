# infra\route_table\industrial.tf

resource "aws_route_table" "industrial_rt" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"  # Rota padrão para a internet ou outras redes
    network_interface_id = var.industrial_eni_firewall_to_id
  }

  tags = {
    Name = "Industrial Route Table"
  }
}

resource "aws_route_table_association" "industrial_rta" {
  subnet_id      = var.industrial_subnet_id
  route_table_id = aws_route_table.industrial_rt.id
}
