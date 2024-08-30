# Interface de Rede Externa
resource "aws_network_interface" "firewall_externo_interface" {
  subnet_id       = "subnet-04b636f5d719f36f9"
  description     = "Interface Externa do Firewall"
  private_ips     = ["172.31.1.6"]
  security_groups = [aws_security_group.firewall_externo_sg.id]
}

# Interface de Rede Interna 1 (IDMZ)
resource "aws_network_interface" "firewall_interno_interface_1" {
  subnet_id       = "subnet-0cf09791b786738b0"
  description     = "Interface Interna 1 do Firewall"
  private_ips     = ["172.31.2.5"]
  security_groups = [aws_security_group.firewall_interno_sg.id]
}

# Interface de Rede Interna 2 (Cell Area Zone)
resource "aws_network_interface" "firewall_interno_interface_2" {
  subnet_id       = "subnet-0edde42407c03f8df"
  description     = "Interface Interna 2 do Firewall"
  private_ips     = ["172.31.3.5"]
  security_groups = [aws_security_group.firewall_interno_sg.id]
}
