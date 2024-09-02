# infra\interface\public.tf

resource "aws_network_interface" "public_eni_firewall_to" {
  subnet_id       = var.public_subnet_id
  description     = "Interface da Rede Enterprise no Firewall TO"
#   private_ips     = [var.public_subnet_cidr]
  security_groups = [var.default_sg_id]
}

resource "aws_eip" "one" {
  domain                    = "vpc"
  network_interface         = aws_network_interface.public_eni_firewall_to.id
}