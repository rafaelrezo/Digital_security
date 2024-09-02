# infra\subnet\output.tf

output "enterprise_subnet_id" {
  value = aws_subnet.enterprise_subnet.id
}

output "idmz_subnet_id" {
  value = aws_subnet.idmz_subnet.id
}

output "industrial_subnet_id" {
  value = aws_subnet.industrial_subnet.id
}

output "public_subnet_id" {
  value = aws_subnet.public_subnet.id
}