# # infra\service\nginx.tf

resource "aws_instance" "nginx_server" {
  ami               = "ami-04a81a99f5ec58529"  # Ubuntu Server 24.04 LTS (HVM), SSD Volume Type 64 bits
  instance_type     = "t2.micro"
  key_name          = "crie-e-substitua-sua-chave_1"
  subnet_id         = var.idmz_subnet_id  # Rede IDMZ
  vpc_security_group_ids = [var.idmz_sg_id]  # Rede IDMZ

  tags = {
    Name = "Nginx-Server"
  }

  user_data = file("service\\nginx\\nginx-install.sh")
}