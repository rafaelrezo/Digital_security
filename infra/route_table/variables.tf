# infra\route_table\variables.tf

variable "vpc_id" {
    type        = string
    description = "identificador único da VPC do seu ambiente"
}

variable "enterprise_subnet_id" {
    type        = string
    description = "identificador único da VPC do seu ambiente"
}