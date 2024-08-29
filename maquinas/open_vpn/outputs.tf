output "openvpn_server_public_ip" {
  description = "Endereço IP público da instância do OpenVPN"
  value       = aws_instance.openvpn_server.public_ip
}

output "private_key_pem" {
  description = "Chave privada em formato PEM"
  value       = tls_private_key.my_key.private_key_pem
  sensitive   = true
}

output "key_pair_name" {
  description = "Nome do par de chaves SSH gerado"
  value       = aws_key_pair.deployer.key_name
}
