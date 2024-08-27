variable "cidr_block" {
  description = "Bloco CIDR para a VPC da DMZ"
  type        = string
  default     = "10.0.1.0/24"
}

variable "subnet_cidr" {
  description = "Bloco CIDR para a Subnet da DMZ"
  type        = string
  default     = "10.0.1.0/28"
}
