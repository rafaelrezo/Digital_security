# infra\interface\idmz.tf

resource "aws_network_interface" "idmz_eni_firewall_to" {
  subnet_id       = var.idmz_subnet_id
  description     = "Interface da Rede IDMZ no Firewall TO"
  private_ips     = [var.idmz_default_gateway]
  security_groups = [var.idmz_sg_id]
}