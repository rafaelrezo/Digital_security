provider "aws" {
  region = "us-east-1"  # Ajuste conforme necessário
}

resource "aws_vpc" "main_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "main_gw" {
  vpc_id = aws_vpc.main_vpc.id
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main_gw.id
  }
}

resource "aws_route_table_association" "public_rt_assoc" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_security_group" "openvpn_sg" {
  vpc_id = aws_vpc.main_vpc.id

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
resource "tls_private_key" "my_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Criando um par de chaves na AWS com a chave pública gerada
resource "aws_key_pair" "deployer" {
  key_name   = "my_key_pair"
  public_key = tls_private_key.my_key.public_key_openssh
}

resource "aws_instance" "openvpn_server" {
  ami           = "ami-04a81a99f5ec58529"  # Amazon Ununtu 24.04
  instance_type          = "t2.micro"
  key_name      = aws_key_pair.deployer.key_name  # Associa a chave SSH
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.openvpn_sg.id]

  tags = {
    Name = "OpenVPN-Server-novo"
  }

  user_data = file("openvpn-install.sh")
}

output "openvpn_server_public_ip" {
  value = aws_instance.openvpn_server.public_ip
}

# (Passo 3 - Opcional) Saída da chave privada, se gerada via Terraform
output "private_key_pem" {
  value     = tls_private_key.my_key.private_key_pem
  sensitive = true
}

# (Passo 3 - Opcional) Saída do nome da chave SSH
output "key_pair_name" {
  value = aws_key_pair.deployer.key_name
}
