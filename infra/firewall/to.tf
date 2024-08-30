resource "aws_instance" "firewall_to" {
  ami           = "ami-0e86e20dae9224db8"
  instance_type = "m5a.large"
  key_name      = "firewall_to"
  ebs_optimized = true
  user_data     = file("to-install.sh")

  network_interface {
    network_interface_id = aws_network_interface.firewall_externo_interface.id
    device_index         = 0
  }

  network_interface {
    network_interface_id = aws_network_interface.firewall_interno_interface_1.id
    device_index         = 1
  }

  network_interface {
    network_interface_id = aws_network_interface.firewall_interno_interface_2.id
    device_index         = 2
  }

  tags = {
    Name = "firewall_to"
  }
}
