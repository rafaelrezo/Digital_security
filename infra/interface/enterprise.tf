# infra\interface\enterprise.tf

resource "aws_network_interface" "enterprise_eni_firewall_to" {
  subnet_id       = var.enterprise_subnet_id
  description     = "Interface da Rede Enterprise no Firewall TO"
  private_ips     = [var.enterprise_default_gateway]  # IP privado dentro da subnet
  security_groups = [var.enterprise_sg_id]
}