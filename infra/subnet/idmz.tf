provider "aws" {
  region = "us-east-1"
}

# Security Group para a IDMZ
resource "aws_security_group" "idmz_sg" {
  name_prefix = "idmz"
  description = "Security group for IDMZ network"
  vpc_id      = "vpc-035de6a04b60456dc"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["172.31.2.5/32"]  # Somente IP associado à interface do firewall (IDMZ)
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["172.31.2.0/24"]  # Comunicação dentro da IDMZ
  }
}
