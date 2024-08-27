output "firewall_to_instance_id" {
  description = "ID da instância EC2 do firewall TO"
  value       = aws_instance.firewall_to.id
}

output "firewall_to_public_ip" {
  description = "Endereço IP público da instância do firewall TO"
  value       = aws_instance.firewall_to.public_ip
}
