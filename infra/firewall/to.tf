# infra\firewall\to.tf

resource "aws_instance" "firewall_to" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name
  ebs_optimized = true
  user_data     = file(var.user_data)
  

  network_interface {
    network_interface_id = var.enterprise_eni_firewall_to_id
    device_index         = 0
  }

  network_interface {
    network_interface_id = var.idmz_eni_firewall_to_id
    device_index         = 1
  }

  network_interface {
    network_interface_id = var.industrial_eni_firewall_to_id
    device_index         = 2
  }

  network_interface {
    network_interface_id = var.public_eni_firewall_to_id
    device_index         = 3
  }

  tags = {
    Name = "firewall_to"
  }
}
