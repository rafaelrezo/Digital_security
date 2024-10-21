# infra\interface\industrial.tf

resource "aws_network_interface" "industrial_eni_firewall_to" {
  subnet_id       = var.industrial_subnet_id
  description     = "Interface da Rede Industrial no Firewall TO"
  private_ips     = [var.industrial_default_gateway]
  security_groups = [var.industrial_sg_id]
}