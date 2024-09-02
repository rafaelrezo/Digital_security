# infra\subnet\variables.tf

# variable "vpc_id" {
#     type        = string
#     description = "identificador único da VPC do seu ambiente"
# }

variable "enterprise_subnet_id" {
    type        = string
    description = "Identificador único da Subnet Enterprise"
}

variable "enterprise_default_gateway" {
    type        = string
    description = "IP do Default gateway da subnet Enterprise"
}

variable "idmz_subnet_id" {
    type        = string
    description = "Identificador único da Subnet IDMZ"
}

variable "idmz_default_gateway" {
    type        = string
    description = "IP do Default gateway da subnet IDMZ"
}

variable "industrial_subnet_id" {
    type        = string
    description = "Identificador único da Subnet Industrial"
}

variable "industrial_default_gateway" {
    type        = string
    description = "IP do Default gateway da subnet Industrial"
}

variable "enterprise_sg_id" {
    type        = string
    description = "IP do Default gateway da subnet Industrial"
}

variable "idmz_sg_id" {
    type        = string
    description = "IP do Default gateway da subnet Industrial"
}

variable "industrial_sg_id" {
    type        = string
    description = "IP do Default gateway da subnet Industrial"
}

# Variables para Interface de IP público

# variable "public_subnet_id" {
#     type        = string
#     description = "Identificador único da Subnet Enterprise"
# }

# variable "public_subnet_cidr" {
#     type        = string
#     description = "Identificador único da Subnet Enterprise"
# }

# variable "default_sg_id" {
#     type        = string
#     description = "Identificador único da Subnet Enterprise"
# }