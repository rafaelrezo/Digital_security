# infra\security_group\industrial.tf

resource "aws_security_group" "industrial_sg" {
  name_prefix = "industrial_sg"
  description = "Grupo de regras associadas a Rede Industrial"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.industrial_cidr]  # Entrada apenas dos IP's do CIDR
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.industrial_cidr]   # Saída apenas dos IP's do CIDR
  }
}