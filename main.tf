provider "aws" {
  region = "us-east-1"  # Defina a região conforme necessário
}

module "cell_area_zone" {
  source = "./rede/cell_area_zone"
}

module "corporativa" {
  source = "./rede/corporativa"
}

module "idmz" {
  source = "./rede/idmz"
}

module "industrial_security_zone" {
  source = "./rede/industrial_security_zone"
}

module "firewall_corporativo" {
  source = "./firewall/corporativo"
}

module "firewall_to" {
  source = "./firewall/TO"
}

module "ldap_service" {
  source = "./service/ldap"
}

module "mysql_service" {
  source = "./service/mysql"
}

module "openvpn_service" {
  source = "./service/open_vpn"
}
