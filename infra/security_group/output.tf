# infra\security_group\output.tf

output "enterprise_sg_id" {
  value = aws_security_group.enterprise_sg.id
}

output "idmz_sg_id" {
  value = aws_security_group.idmz_sg.id
}

output "industrial_sg_id" {
  value = aws_security_group.industrial_sg.id
}