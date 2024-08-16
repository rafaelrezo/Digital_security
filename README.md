# Projeto Terraform para Criação de Ambiente na AWS

Este repositório contém um conjunto de scripts Terraform destinados a criar e configurar um ambiente na AWS. O objetivo é facilitar o provisionamento de recursos na AWS através da AWS Academy.

## Sobre o Ambiente

O ambiente criado por esses scripts inclui uma configuração típica de rede e servidores na AWS. Ele abrange a criação de VPCs, sub-redes, grupos de segurança, gateways de internet, e instâncias EC2, com o objetivo de simular um ambiente de produção que pode ser utilizado para aprendizado ou testes. O IP público das instâncias é configurado dinamicamente utilizando a meta-data da AWS.

## Organização do Projeto

O projeto é organizado da seguinte forma:

- **`main.tf`**: Contém a configuração principal para criar os recursos na AWS, incluindo a VPC, sub-redes, e instâncias EC2.
- **`variables.tf`**: Define as variáveis de entrada que podem ser ajustadas para personalizar o ambiente, como regiões, tamanhos de instância, etc.
- **`outputs.tf`**: Define as saídas que são exibidas após a criação do ambiente, como os IPs públicos das instâncias e IDs dos recursos.
- **`modules/`**: Contém módulos reutilizáveis que podem ser incluídos em diferentes partes do projeto para organizar e reaproveitar código.

Todos os arquivos Terraform neste repositório são organizados para garantir modularidade e reutilização, facilitando a manutenção e expansão do ambiente ao longo do tempo.
