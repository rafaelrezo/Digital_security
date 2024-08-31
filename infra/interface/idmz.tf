# infra\interface\idmz.tf

resource "aws_network_interface" "firewall_interno_interface_1" {
  subnet_id       = "subnet-0cf09791b786738b0"
  description     = "Interface Interna 1 do Firewall"
  private_ips     = ["172.31.2.5"]
  security_groups = [aws_security_group.firewall_interno_sg.id]
}