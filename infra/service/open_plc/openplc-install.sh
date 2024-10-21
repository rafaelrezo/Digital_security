#!/bin/sh
set -e

sudo apt update

sudo apt install -y git build-essential python3 python3-pip libmodbus-dev libmbedtls-dev

sudo mkdir /opt/openplc

cd /opt/openplc

sudo git clone https://github.com/thiagoralves/OpenPLC_v3.git /opt/openplc

sudo ./install.sh linux

sudo systemctl enable openplc.service

sudo systemctl start openplc.service