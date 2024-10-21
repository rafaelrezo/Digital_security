provider "aws" {
  region = "us-east-1"  # Ajuste conforme necessário
}

resource "aws_vpc" "vpc_nginx" {
  cidr_block = "10.0.0.0/16"
tags = {
    Name = "main"
  }
}

resource "aws_subnet" "public_subnet_nginx" {
  vpc_id                  = aws_vpc.vpc_nginx.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
tags = {
    Name = "minha_subnet"
  }

}

resource "aws_internet_gateway" "gw_nginx" {
  vpc_id = aws_vpc.vpc_nginx.id
tags = {
    Name = "meu_gateway"
  }

}

resource "aws_route_table" "public_rt_nginx" {
  vpc_id = aws_vpc.vpc_nginx.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw_nginx.id
  }
}

resource "aws_route_table_association" "public_rt_assoc_nginx" {
  subnet_id      = aws_subnet.public_subnet_nginx.id
  route_table_id = aws_route_table.public_rt_nginx.id
}

resource "aws_security_group" "sg_nginx" {
  vpc_id = aws_vpc.vpc_nginx.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 1194
    to_port     = 1194
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

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

# (Passo 1) Criação de uma Chave SSH (pode usar sua chave existente)
# Se você não tem uma chave SSH, use este bloco:
resource "tls_private_key" "minha_chave" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Criando um par de chaves na AWS com a chave pública gerada
resource "aws_key_pair" "deployer_nginx" {
  key_name   = "par_de_chaves"
  public_key = tls_private_key.minha_chave.public_key_openssh
}

resource "aws_instance" "nginx_server" {
  ami           = "ami-04a81a99f5ec58529"  # Ubuntu Server 24.04 LTS (HVM), SSD Volume Type 64 bits
  instance_type          = "t2.micro"
  key_name      = aws_key_pair.deployer_nginx.key_name  # Associa a chave SSH
  subnet_id              = aws_subnet.public_subnet_nginx.id
  vpc_security_group_ids = [aws_security_group.sg_nginx.id]

  tags = {
    Name = "Nginx_server"
  }

  user_data = file("instalar_nginx.sh")
}

output "new_openvpn_server_public_ip" {
  value = aws_instance.nginx_server.public_ip
}

# (Passo 3 - Opcional) Saída da chave privada, se gerada via Terraform
output "private_key_pem" {
  value     = tls_private_key.minha_chave.private_key_pem
  sensitive = true
}

# (Passo 3 - Opcional) Saída do nome da chave SSH
output "key_pair_name" {
  value = aws_key_pair.deployer_nginx.key_name
}