# Roteiro para Aula de Cibersegurança: Configuração de Ambiente com Terraform

## Objetivo da Aula

- Ensinar a instalar e configurar o Terraform no Windows e Ubuntu.
- Configurar um ambiente AWS EC2 utilizando Terraform.
- Configurar tfstate localmente e salvar no GitHub.
- Criar uma VPC com DMZ e instanciar servidores EC2 com OpenVPN, 389LDAP e Nginx.
- Configurar regras de firewall para acesso seguro.

## Estrutura da Aula

### 1. Introdução

- Apresentação do Terraform.
- Explicação sobre infraestrutura como código (IaC).

### 2. Instalação do Terraform

#### Windows

1. Acesse o [site do Terraform](https://www.terraform.io/downloads).
2. Baixe o executável para Windows.
3. Extraia o arquivo baixado e adicione o caminho do Terraform às variáveis de ambiente.
4. Verifique a instalação abrindo o prompt de comando e digitando `terraform`.

#### Ubuntu

1. Atualize a lista de pacotes:
   ```bash
   sudo apt-get update
   ```
2. Instale os pacotes necessários:
   ```bash
   sudo apt-get install -y gnupg software-properties-common curl
   ```
3. Adicione a chave GPG do repositório oficial do Terraform:
   ```bash
   curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
   ```
4. Adicione o repositório oficial do Terraform:
   ```bash
   sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
   ```
5. Instale o Terraform:
   ```bash
   sudo apt-get update && sudo apt-get install terraform
   ```
6. Verifique a instalação:
   ```bash
   terraform -v
   ```

### 3. Configurar do AWS CLI
Para poder utilizar o Terraform, é necessário configurar o aws_cli, para que o terraform consiga acessar a EC2 e realizar a configurações com suas credencias. Com o aws_cli é possível configurar serviços na AWS utilizando o terminal.

1. Instale o AWS CLI:

   ```bash
   pip install awscli
   ```
6. Configure o AWS CLI com suas credenciais:

   ```bash
   aws configure
   ```

   - Insira sua AWS Access Key ID.
   - Insira sua AWS Secret Access Key.
   - Defina a região padrão (por exemplo, `us-east-1`).
   - Defina o formato de saída padrão (por exemplo, `json`).

Se você estiver usando o AWS Academy, as credenciais no Laboratório de Aprendizagem, após iniciar o lab, na aba AWS Detail. Copie o conteúdo para seu arquivo credentials.

### 4. Configuração do Ambiente AWS EC2 com Terraform


1. Crie o arquivo `main.tf` com a configuração do Terraform:

```hcl
provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "dmz" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
}

resource "aws_instance" "openvpn_server" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.dmz.id
  key_name      = var.key_name

  tags = {
    Name = "OpenVPN Server"
  }

  user_data = <<-EOF
    #!/bin/bash
    yum update -y
    yum install -y openvpn
  EOF
}

resource "aws_instance" "ldap_server" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.dmz.id
  key_name      = var.key_name

  tags = {
    Name = "LDAP Server"
  }

  user_data = <<-EOF
    #!/bin/bash
    yum update -y
    yum install -y 389-ds-base
    setup-ds-admin.pl -s -f setup.inf
  EOF
}

resource "aws_instance" "web_server" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.dmz.id
  key_name      = var.key_name

  tags = {
    Name = "Web Server"
  }

  user_data = <<-EOF
    #!/bin/bash
    yum update -y
    yum install -y nginx
    systemctl start nginx
    systemctl enable nginx
  EOF
}

output "openvpn_server_ip" {
  value = aws_instance.openvpn_server.public_ip
}
```
