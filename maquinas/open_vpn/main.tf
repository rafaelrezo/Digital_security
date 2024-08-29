module "dmz" {
  source = "../../rede/dmz"
}

provider "aws" {
  region = var.region  # Região configurável via variáveis
}

resource "aws_instance" "openvpn_server" {
  ami                = var.ami_id
  instance_type      = var.instance_type
  key_name           = var.key_name
  subnet_id          = module.dmz.dmz_subnet_id  # Herda o subnet_id da DMZ
  vpc_security_group_ids = [module.dmz.dmz_security_group_id]  # Herda o security_group_id da DMZ

  tags = {
    Name = var.instance_name  # Nome configurável da instância
  }

  # user_data = file("openvpn-install.sh")  # Script de instalação, opcional
}

# (Passo 3 - Opcional) Criação de uma chave SSH, se ainda não existir
resource "tls_private_key" "my_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Criação do par de chaves na AWS usando a chave pública gerada
resource "aws_key_pair" "deployer" {
  key_name   = "my_key_pair"
  public_key = tls_private_key.my_key.public_key_openssh
}
