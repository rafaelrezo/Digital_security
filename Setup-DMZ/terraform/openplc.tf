resource "aws_instance" "openplc" {
  ami           = "ami-0e86e20dae9224db8"  # Amazon Ununtu 24.04
  instance_type          = "t2.small"
  key_name      = aws_key_pair.deployer.key_name  # Associa a chave SSH
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.openvpn_sg.id]

  tags = {
    Name = "OpenPLC-novo"
  }

  user_data = file("openplc-install.sh")
}

output "openplc_public_ip" {
  value = aws_instance.openplc.public_ip
}