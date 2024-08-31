# infra\security_group\enterprise.tf

resource "aws_security_group" "corporativa_sg" {
  name_prefix = "corporativa_sg"
  description = "Grupo de regras associadas a "
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.enterprise_gateway_ip]  # Permitir tráfego apenas dentro da subnet
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.enterprise_cidr]  # Permitir tráfego de saída dentro da subnet
  }
}
