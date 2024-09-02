# infra\service\variables.tf

variable "idmz_subnet_id" {
    type        = string
    description = "Identificador único da Subnet IDMZ"
}

variable "industrial_subnet_id" {
    type        = string
    description = "Identificador único da Subnet Industrial"
}

variable "idmz_sg_id" {
    type        = string
    description = "IP do Default gateway da subnet Industrial"
}

variable "industrial_sg_id" {
    type        = string
    description = "IP do Default gateway da subnet Industrial"
}