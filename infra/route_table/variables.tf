# infra\route_table\variables.tf

variable "vpc_id" {
    type        = string
    description = "identificador único da VPC do seu ambiente"
}

variable "enterprise_eni_firewall_to_id" {
    type        = string
    description = "identificador único da VPC do seu ambiente"
}

variable "idmz_eni_firewall_to_id" {
    type        = string
    description = "identificador único da VPC do seu ambiente"
}

variable "industrial_eni_firewall_to_id" {
    type        = string
    description = "identificador único da VPC do seu ambiente"
}

variable "enterprise_subnet_id" {
    type        = string
    description = "Identificador único da Subnet Enterprise"
}

variable "idmz_subnet_id" {
    type        = string
    description = "Identificador único da Subnet IDMZ"
}

variable "industrial_subnet_id" {
    type        = string
    description = "Identificador único da Subnet Industrial"
}