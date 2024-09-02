# infra\firewall\variable.tf

variable "ami" {
  description = "ID da VPC para as subnets e security groups"
  type        = string
}

variable "instance_type" {
  description = "ID da VPC para as subnets e security groups"
  type        = string
}

variable "key_name" {
  description = "ID da VPC para as subnets e security groups"
  type        = string
}

variable "user_data" {
  description = "ID da VPC para as subnets e security groups"
  type        = string
}

variable "enterprise_eni_firewall_to_id" {
  description = "ID da VPC para as subnets e security groups"
  type        = string
}

variable "idmz_eni_firewall_to_id" {
  description = "ID da VPC para as subnets e security groups"
  type        = string
}

variable "industrial_eni_firewall_to_id" {
  description = "ID da VPC para as subnets e security groups"
  type        = string
}
