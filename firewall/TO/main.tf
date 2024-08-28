provider "aws" {
  region = "us-east-1"  # Altere para a região adequada
}

# Criação do Security Group
resource "aws_security_group" "firewall_to_sg" {
  name_prefix = "firewall_to"
  description = "Security group for firewall_to instance"
  vpc_id      = "vpc-035de6a04b60456dc"  # Substitua pelo ID da sua VPC

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 1194
    to_port     = 1194
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Interface de Rede 1
resource "aws_network_interface" "firewall_to_interface_1" {
  subnet_id       = "subnet-04b636f5d719f36f9"
  description     = "firewall_to_interface_1"
  private_ips     = ["172.31.1.5"]
  security_groups = [aws_security_group.firewall_to_sg.id]
}

# Interface de Rede 2
resource "aws_network_interface" "firewall_to_interface_2" {
  subnet_id       = "subnet-0cf09791b786738b0"
  description     = "firewall_to_interface_2"
  private_ips     = ["172.31.2.5"]
  security_groups = [aws_security_group.firewall_to_sg.id]
}

# Interface de Rede 3
resource "aws_network_interface" "firewall_to_interface_3" {
  subnet_id       = "subnet-0edde42407c03f8df"
  description     = "firewall_to_interface_3"
  private_ips     = ["172.31.3.5"]
  security_groups = [aws_security_group.firewall_to_sg.id]
}

# Criação da Instância EC2 com múltiplas interfaces de rede
resource "aws_instance" "firewall_to" {
  ami           = "ami-0e86e20dae9224db8" # ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-20240801
  instance_type = "m5a.large"
  key_name      = "firewall_to"
  ebs_optimized = true
  user_data     = "cGFzc3dvcmQ9MjAxNjExNTptZ210bmV0PTE3Mi4zMS4xLjAvMjQ="

  network_interface {
    network_interface_id = aws_network_interface.firewall_to_interface_1.id
    device_index         = 0
  }

  network_interface {
    network_interface_id = aws_network_interface.firewall_to_interface_2.id
    device_index         = 1
  }

  network_interface {
    network_interface_id = aws_network_interface.firewall_to_interface_3.id
    device_index         = 2
  }

  tags = {
    Name = "firewall_to"
  }
}