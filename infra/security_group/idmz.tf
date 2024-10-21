# infra\security_group\idmz.tf

resource "aws_security_group" "idmz_sg" {
  name_prefix = "idmz_sg"
  description = "Grupo de regras associadas a Rede IDMZ"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.idmz_cidr]  # Entrada apenas dos IP's do CIDR
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.idmz_cidr]  # Saída apenas dos IP's do CIDR
  }
}