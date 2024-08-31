# infra\route_table\idmz.tf

resource "aws_route_table" "idmz_rt" {
  vpc_id = "vpc-xxxxxxxx"  # Substitua pelo ID da sua VPC

  route {
    cidr_block = "0.0.0.0/0"  # Rota padrão para a internet ou outras redes
    network_interface_id = "eni-xxxxxxxx"  # Substitua pelo ID da interface da EC2 que atua como gateway
  }

  tags = {
    Name = "IDMZ Route Table"
  }
}

resource "aws_route_table_association" "idmz_rta" {
  subnet_id      = "subnet-xxxxxxxx"  # Substitua pelo ID da Subnet IDMZ
  route_table_id = aws_route_table.idmz_rt.id
}
