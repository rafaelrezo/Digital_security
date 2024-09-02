# infra\interface\output.tf

output "enterprise_eni_firewall_to_id" {
  value = aws_network_interface.enterprise_eni_firewall_to.id
}

output "idmz_eni_firewall_to_id" {
  value = aws_network_interface.idmz_eni_firewall_to.id
}

output "industrial_eni_firewall_to_id" {
  value = aws_network_interface.industrial_eni_firewall_to.id
}
