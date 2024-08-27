#!/bin/bash
set -e

# Atualizar sistema e instalar OpenVPN e Easy-RSA
yum update -y
yum install -y openvpn easy-rsa

# Configurar Easy-RSA
make-cadir ~/openvpn-ca
cd ~/openvpn-ca
cat > vars <<EOF
set_var EASYRSA_REQ_COUNTRY    "US"
set_var EASYRSA_REQ_PROVINCE   "California"
set_var EASYRSA_REQ_CITY       "San Francisco"
set_var EASYRSA_REQ_ORG        "MyOrg"
set_var EASYRSA_REQ_EMAIL      "email@example.com"
set_var EASYRSA_REQ_OU         "MyOU"
EOF

# Construir a CA
./easyrsa init-pki
./easyrsa build-ca nopass

# Criar certificado e chave para o servidor
./easyrsa gen-req server nopass
./easyrsa sign-req server server
./easyrsa gen-dh
openvpn --genkey --secret ta.key

# Copiar certificados e chaves para o diretório de configuração do OpenVPN
cp pki/ca.crt pki/private/server.key pki/issued/server.crt pki/dh.pem ta.key /etc/openvpn/

# Criar arquivo de configuração do servidor OpenVPN
cat > /etc/openvpn/server.conf <<EOF
port 1194
proto udp
dev tun
ca ca.crt
cert server.crt
key server.key
dh dh.pem
tls-auth ta.key 0
cipher AES-256-CBC
auth SHA256
server 10.8.0.0 255.255.255.0
ifconfig-pool-persist ipp.txt
push "redirect-gateway def1 bypass-dhcp"
push "dhcp-option DNS 8.8.8.8"
push "dhcp-option DNS 8.8.4.4"
keepalive 10 120
comp-lzo
user nobody
group nogroup
persist-key
persist-tun
status openvpn-status.log
verb 3
EOF

# Iniciar e habilitar o serviço OpenVPN
systemctl start openvpn@server
systemctl enable openvpn@server

# Gerar certificado e chave para um cliente
cd ~/openvpn-ca
./easyrsa gen-req client1 nopass
./easyrsa sign-req client client1

# Criar diretório para armazenar arquivos do cliente
mkdir -p ~/client-configs/keys
cp pki/ca.crt pki/issued/client1.crt pki/private/client1.key ta.key ~/client-configs/keys/

# Criar arquivo de configuração do cliente
mkdir -p ~/client-configs/files
cat > ~/client-configs/base.conf <<EOF
client
dev tun
proto udp
remote $(curl -s http://169.254.169.254/latest/meta-data/public-ipv4) 1194
resolv-retry infinite
nobind
user nobody
group nogroup
persist-key
persist-tun
remote-cert-tls server
cipher AES-256-CBC
auth SHA256
key-direction 1
comp-lzo
verb 3
EOF

# Script para gerar arquivo de configuração do cliente
cat > ~/client-configs/make_config.sh <<'EOF'
#!/bin/bash

# Primeiro argumento: Identificador do cliente

KEY_DIR=~/client-configs/keys
OUTPUT_DIR=~/client-configs/files
BASE_CONFIG=~/client-configs/base.conf

cat ${BASE_CONFIG} \
    <(echo -e '<ca>') \
    ${KEY_DIR}/ca.crt \
    <(echo -e '</ca>\n<cert>') \
    ${KEY_DIR}/${1}.crt \
    <(echo -e '</cert>\n<key>') \
    ${KEY_DIR}/${1}.key \
    <(echo -e '</key>\n<tls-auth>') \
    ${KEY_DIR}/ta.key \
    <(echo -e '</tls-auth>') \
    > ${OUTPUT_DIR}/${1}.ovpn
EOF

chmod 700 ~/client-configs/make_config.sh

# Gerar arquivo de configuração para o cliente1
~/client-configs/make_config.sh client1
