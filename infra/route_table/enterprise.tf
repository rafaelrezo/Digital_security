# infra\route_table\enterprise.tf

data "aws_internet_gateway" "existing_igw" {
  filter {
    name   = "attachment.vpc-id"
    values = [var.vpc_id]
  }
}

resource "aws_eip" "firewall_to_eip" {}

resource "aws_route_table" "enterprise_rt" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"  # Rota para a internet
    gateway_id = data.aws_internet_gateway.existing_igw.id
  }
}

resource "aws_eip_association" "firewall_to_eip_assoc" {
  allocation_id        = aws_eip.firewall_to_eip.id
  network_interface_id = var.enterprise_eni_firewall_to_id
}

resource "aws_route_table_association" "enterprise_rta" {
  subnet_id      = var.enterprise_subnet_id
  route_table_id = aws_route_table.enterprise_rt.id
}