resource "aws_vpc" "corporativa_vpc" {
  cidr_block = var.cidr_block
  tags = {
    Name = "Corporativa_VPC"
  }
}

resource "aws_subnet" "corporativa_subnet" {
  vpc_id            = aws_vpc.corporativa_vpc.id
  cidr_block        = var.subnet_cidr
  map_public_ip_on_launch = true
  tags = {
    Name = "Corporativa_Subnet"
  }
}
