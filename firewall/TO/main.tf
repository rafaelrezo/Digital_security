module "idmz" {
  source = "../../rede/idmz"
}

module "corporativa" {
  source = "../../rede/corporativa"
}

module "industrial_security_zone" {
  source = "../../rede/industrial_security_zone"
}

resource "aws_instance" "firewall_to" {
  ami           = var.ami_id # pfSense-plus-ec2-24.03-RELEASE-aarch64 11-prod-fy74w7wpoqlrg
  instance_type = var.instance_type
  key_name      = var.key_name

# Interface conectada à IDMZ
  network_interface {
    device_index = 0
    subnet_id    = module.idmz.subnet_id 
    security_groups = [module.idmz.security_group_id]
  }

# Interface conectada à Rede Corporativa
  network_interface {
    device_index = 1
    subnet_id    = module.corporativa.subnet_id 
    security_groups = [module.corporativa.security_group_id]
  }

# Interface conectada à Zona de Segurança Industrial
  network_interface {
    device_index = 2
    subnet_id    = module.industrial_security_zone.subnet_id
    security_groups = [module.industrial_security_zone.security_group_id]
  }

  tags = {
    Name = var.instance_name
  }

  user_data = file(var.user_data_file)  # Script de configuração de firewall
}
