# infra\security_group\enterprise.tf

resource "aws_security_group" "enterprise_sg" {
  name_prefix = "enterprise_sg"
  description = "Grupo de regras associadas a Rede Enterprise"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.enterprise_cidr]  # Entrada apenas dos IP's do CIDR
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.enterprise_cidr]  # Saída apenas dos IP's do CIDR
  }
}