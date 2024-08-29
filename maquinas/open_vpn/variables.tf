variable "ami_id" {
  description = "ID da AMI a ser usada para a instância"
  type        = string
  default     = "ami-04a81a99f5ec58529"  # Exemplo de AMI para Ubuntu 24.04
}

variable "instance_type" {
  description = "Tipo da instância EC2"
  type        = string
  default     = "t2.micro"  # Tipo de instância padrão
}

variable "key_name" {
  description = "Nome do par de chaves SSH"
  type        = string
  default     = aws_key_pair.deployer.key_name  # Padrão gerado pelo Terraform
}

variable "instance_name" {
  description = "Nome da instância EC2"
  type        = string
  default     = "OpenVPN-Server"
}
