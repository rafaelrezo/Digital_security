# infra\security_group\industrial.tf

resource "aws_security_group" "industrial_sg" {
  name_prefix = "industrial_sg"
  description = "Security group for Industrial Subnet"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["172.31.3.1/32"]  # Permitir tráfego de ingresso apenas do gateway
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["172.31.3.0/24"]  # Permitir tráfego de saída para qualquer IP na subnet
  }
}
