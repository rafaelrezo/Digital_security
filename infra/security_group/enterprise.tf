# Security Group para a Rede Industrial
resource "aws_security_group" "firewall_industrial_sg" {
  name_prefix = "firewall_industrial"
  description = "Security group for industrial network interface"
  vpc_id      = "vpc-035de6a04b60456dc"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["172.31.3.5/32"]  # Permitir apenas o IP associado à interface industrial do firewall
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["172.31.3.0/24"]  # Permitir tráfego de saída dentro da sub-rede industrial
  }
}
