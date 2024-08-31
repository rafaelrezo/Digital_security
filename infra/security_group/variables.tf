# infra\security_group\variables.tf

variable "vpc_id" {
  description = "ID da VPC para as subnets e security groups"
  type        = string
}

variable "enterprise_cidr" {
  description = "CIDR block para a subnet Corporativa"
  type        = string
  default     = "172.31.1.0/24"
}

variable "enterprise_gateway_ip" {
  description = "IP da interface gateway na subnet Corporativa"
  type        = string
  default     = "172.31.1.1"
}

variable "idmz_cidr" {
  description = "CIDR block para a subnet IDMZ"
  type        = string
  default     = "172.31.2.0/24"
}

variable "idmz_gateway_ip" {
  description = "IP da interface gateway na subnet IDMZ"
  type        = string
  default     = "172.31.2.1"
}

variable "industrial_cidr" {
  description = "CIDR block para a subnet Industrial"
  type        = string
  default     = "172.31.3.0/24"
}

variable "industrial_gateway_ip" {
  description = "IP da interface gateway na subnet Industrial"
  type        = string
  default     = "172.31.3.1"
}

variable "public_ip" {
  description = "IP público criado dinamicamente para acesso à interface externa"
  type        = string
}
