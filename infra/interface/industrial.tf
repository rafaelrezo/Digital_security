# infra\interface\industrial.tf

resource "aws_network_interface" "firewall_externo_interface" {
  subnet_id       = "subnet-04b636f5d719f36f9"
  description     = "Interface Externa do Firewall"
  private_ips     = ["172.31.1.6"]
  security_groups = [aws_security_group.firewall_externo_sg.id]
}