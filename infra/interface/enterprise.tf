# infra\interface\enterprise.tf

resource "aws_network_interface" "firewall_interno_interface_2" {
  subnet_id       = "subnet-0edde42407c03f8df"
  description     = "Interface Interna 2 do Firewall"
  private_ips     = ["172.31.3.5"]
  security_groups = [aws_security_group.firewall_interno_sg.id]
}