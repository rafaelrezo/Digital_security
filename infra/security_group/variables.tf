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

variable "idmz_cidr" {
  description = "CIDR block para a subnet IDMZ"
  type        = string
  default     = "172.31.2.0/24"
}

variable "industrial_cidr" {
  description = "CIDR block para a subnet Industrial"
  type        = string
  default     = "172.31.3.0/24"
}
