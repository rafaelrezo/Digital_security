provider "aws" {
  region = "us-east-1"
}

# Criação do Elastic IP
resource "aws_eip" "public_ip" {
  vpc = true
}

# Security Group
resource "aws_security_group" "firewall_corp_sg" {
  name_prefix = "firewall_corp_sg"
  description = "Security group for corporate firewall instance"
  vpc_id      = "vpc-035de6a04b60456dc"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Interface de Rede 1 (pública)
resource "aws_network_interface" "firewall_interface_1" {
  subnet_id       = "subnet-04b636f5d719f36f9"
  description     = "Firewall Public Interface"
  private_ips     = ["172.31.1.6"]
  security_groups = [aws_security_group.firewall_corp_sg.id]
  associate_public_ip_address = true
}

# Interface de Rede 2 (privada)
resource "aws_network_interface" "firewall_interface_2" {
  subnet_id       = "subnet-04b636f5d719f36f9"
  description     = "Firewall Private Interface"
  private_ips     = ["172.31.1.5"]
  security_groups = [aws_security_group.firewall_corp_sg.id]
}

# Instância EC2 com duas interfaces de rede
resource "aws_instance" "firewall_corp" {
  ami           = "ami-0e86e20dae9224db8" # ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-20240801
  instance_type = "m5a.large"
  key_name      = "firewall_corp"
  ebs_optimized = true
  user_data     = "cGFzc3dvcmQ9MjAxNjExNTptZ210bmV0PTE3Mi4zMS4xLjAvMjQ="

  network_interface {
    network_interface_id = aws_network_interface.firewall_interface_1.id
    device_index         = 0
  }

  network_interface {
    network_interface_id = aws_network_interface.firewall_interface_2.id
    device_index         = 1
  }

  tags = {
    Name = "firewall_corp"
  }
}
