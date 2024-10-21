# infra\route_table\idmz.tf

resource "aws_route_table" "idmz_rt" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"  # Rota padrão para a internet ou outras redes
    network_interface_id = var.idmz_eni_firewall_to_id
  }

  tags = {
    Name = "IDMZ Route Table"
  }
}

resource "aws_route_table_association" "idmz_rta" {
  subnet_id      = var.idmz_subnet_id
  route_table_id = aws_route_table.idmz_rt.id
}