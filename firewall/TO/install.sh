#!/bin/bash

# Atualizar pacotes e instalar iptables
sudo apt-get update
sudo apt-get install -y iptables

# Exemplo de configuração de IPTABLES:
# Bloquear todo o tráfego de entrada, exceto para SSH, HTTP e HTTPS
sudo iptables -P INPUT DROP
sudo iptables -P FORWARD DROP
sudo iptables -P OUTPUT ACCEPT

# Permitir tráfego de loopback
sudo iptables -A INPUT -i lo -j ACCEPT

# Permitir tráfego estabelecido e relacionado
sudo iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# Permitir SSH
sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT

# Permitir HTTP
sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT

# Permitir HTTPS
sudo iptables -A INPUT -p tcp --dport 443 -j ACCEPT

# Salvando as regras para persistência
sudo sh -c "iptables-save > /etc/iptables/rules.v4"
