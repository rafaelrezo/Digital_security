provider "aws" {
  region = "us-east-1"
}

# Security Group para a Rede Industrial (Cell Area Zone)
resource "aws_security_group" "industrial_sg" {
  name_prefix = "industrial"
  description = "Security group for Industrial network"
  vpc_id      = "vpc-035de6a04b60456dc"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["172.31.3.5/32"]  # Somente IP associado à interface do firewall (Cell Area Zone)
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["172.31.3.0/24"]  # Comunicação dentro da Rede Industrial
  }
}
