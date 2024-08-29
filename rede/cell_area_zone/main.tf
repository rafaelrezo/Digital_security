resource "aws_vpc" "supervisao_vpc" {
  cidr_block = var.cidr_block
  tags = {
    Name = "Supervisao_VPC"
  }
}

resource "aws_subnet" "supervisao_subnet" {
  vpc_id            = aws_vpc.supervisao_vpc.id
  cidr_block        = var.subnet_cidr
  map_public_ip_on_launch = false
  tags = {
    Name = "Supervisao_Subnet"
  }
}

resource "aws_security_group" "supervisao_sg" {
  vpc_id      = aws_vpc.supervisao_vpc.id
  description = "Segurança para a rede de supervisão"
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "subnet_id" {
  value = aws_subnet.supervisao_subnet.id
}

output "security_group_id" {
  value = aws_security_group.supervisao_sg.id
}
