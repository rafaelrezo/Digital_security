variable "ami_id" {
  description = "ID da AMI a ser usada para a instância do firewall TO"
  type        = string
  default     = "ami-0bab31c52dd9dc3c7"  # pfSense
}

variable "instance_type" {
  description = "Tipo da instância EC2 para o firewall TO"
  type        = string
  default     = "t2.micro"  # free-tear
}

variable "key_name" {
  description = "Nome do par de chaves SSH para acessar o firewall TO"
  type        = string
  default     = "my-key-pair"  # 
}

variable "instance_name" {
  description = "Nome da instância EC2 para o firewall TO"
  type        = string
  default     = "firewall-TO"  # 
}
