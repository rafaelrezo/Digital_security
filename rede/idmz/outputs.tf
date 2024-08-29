output "vpc_id" {
  description = "ID da VPC da DMZ"
  value       = aws_vpc.dmz_vpc.id
}

output "subnet_id" {
  description = "ID da Subnet da DMZ"
  value       = aws_subnet.dmz_subnet.id
}

output "security_group_id" {
  description = "ID do Security Group da DMZ"
  value       = aws_security_group.dmz_sg.id
}