# infra\security_group\idmz.tf

resource "aws_security_group" "idmz_sg" {
  name_prefix = "idmz_sg"
  description = "Security group for IDMZ Subnet"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["172.31.2.1/24"]  # Permitir tráfego de ingresso apenas do gateway
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["172.31.2.0/24"]  # Permitir tráfego de saída dentro da subnet
  }
}
