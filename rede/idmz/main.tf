resource "aws_vpc" "dmz_vpc" {
  cidr_block = var.cidr_block
  tags = {
    Name = "DMZ_VPC"
  }
}

resource "aws_subnet" "dmz_subnet" {
  vpc_id            = aws_vpc.dmz_vpc.id
  cidr_block        = var.subnet_cidr
  map_public_ip_on_launch = true
  tags = {
    Name = "DMZ_Subnet"
  }
}

resource "aws_security_group" "dmz_sg" {
  vpc_id      = aws_vpc.dmz_vpc.id
  description = "Segurança para a DMZ"
  ingress {
    from_port   = 80
    to_port     = 80
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
