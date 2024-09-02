resource "aws_instance" "openplc" {
  ami                     = "ami-0e86e20dae9224db8"  # Amazon Ununtu 24.04
  instance_type           = "t2.small"
  key_name                = "crie-e-substitua-sua-chave_2"
  subnet_id               = var.industrial_subnet_id # Rede Industrial
  vpc_security_group_ids  = [var.industrial_sg_id] # Rede Industrial

  tags = {
    Name = "OpenPLC-Server"
  }

  user_data = file("service\\open_plc\\openplc-install.sh")
}

output "openplc_public_ip" {
  value = aws_instance.openplc.public_ip
}