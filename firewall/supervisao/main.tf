module "dmz" {
  source = "../../rede/dmz"
  cidr_block  = "10.0.1.0/24"
  subnet_cidr = "10.0.1.0/28"
}

module "supervisao" {
  source = "../../rede/supervisao"
  cidr_block  = "10.0.3.0/24"
  subnet_cidr = "10.0.3.0/28"
}

module "firewall_supervisao" {
  source = "../base"

  ami_id          = var.ami_id
  instance_type   = var.instance_type
  key_name        = var.key_name
  subnet_externa_id = module.dmz.subnet_id  # Interface conectada à DMZ
  sg_externa_id   = module.dmz.security_group_id
  subnet_interna_id = module.supervisao.subnet_id  # Interface conectada à rede de supervisão
  sg_interna_id   = module.supervisao.security_group_id
  instance_name   = "Firewall_Supervisao"
  user_data_file  = "supervisao_firewall_setup.sh"  # Script específico para o firewall de supervisão
}
