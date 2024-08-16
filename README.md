# Terraform para Criação de Ambiente na AWS

Este repositório contém um conjunto de scripts Terraform destinados a criar e configurar um ambiente na AWS. O objetivo é facilitar o provisionamento de recursos na AWS através da AWS Academy para explorar as práticas de segurança digital



## Sobre o Ambiente

O objetivo é simular uma infraestrutura industrial complexa e segura, composta por várias redes e firewalls que refletem um ambiente de produção industrial. A ideia é criar um ambiente que inclua:

- **Rede Externa**: Esta rede é acessível a partir da internet pública e serve como a camada externa de defesa, onde serviços públicos podem ser expostos.
- **DMZ (Zona Desmilitarizada)**: Uma rede intermediária que contém serviços que precisam ser acessíveis a partir da rede externa, mas que ainda requerem uma camada adicional de segurança antes de permitir o acesso à rede interna. A DMZ é isolada para minimizar os riscos de segurança.
- **Firewalls**: Cada rede possui firewalls que controlam o tráfego de entrada e saída. Esses firewalls têm duas interfaces, uma conectada à rede externa (ou DMZ) e outra conectada à rede interna. Eles são configurados para realizar filtragem de pacotes e NAT, garantindo que o tráfego entre as redes siga as políticas de segurança definidas.
- **Rede de Supervisão**: Responsável por gerenciar e monitorar o ambiente industrial, esta rede é crítica para a operação segura e eficiente do ambiente. Ela é protegida por firewalls e conectada à DMZ para permitir monitoramento externo controlado.
- **Rede de Controle**: A rede de controle gerencia dispositivos industriais e sistemas de controle, e é altamente restrita. Ela está conectada a outras redes de forma controlada, geralmente passando por múltiplos firewalls.
- **Rede Industrial**: Esta é a rede onde os sistemas industriais operam. Ela está isolada para proteger os sistemas críticos que realizam operações industriais.

O ambiente é projetado para refletir as práticas de segurança que seriam usadas em uma planta industrial real, com a segregação de redes e a aplicação de políticas de segurança rigorosas em todos os níveis.


## Organização do Projeto

O projeto é modularizado em termos de infraestrutura, onde o reúso é promovido principalmente nas configurações das redes. Cada módulo de rede define as sub-redes, grupos de segurança e outras configurações específicas para aquela rede. O `service` que configura uma máquina específica herda essas configurações de rede, garantindo consistência e simplificando a gestão.

Cada `service` configura uma máquina específica que, dependendo da rede na qual está inserida, herda as configurações dessa rede. 

> p.ex: uma máquina na rede DMZ herdará automaticamente as subnets e os security groups definidos para a DMZ. Isso assegura que as máquinas sejam configuradas de acordo com os requisitos de segurança e conectividade específicos de cada rede.

Além disso, o módulo `firewall` contém a configuração específica para máquinas que atuam como firewalls. Essas máquinas possuem duas interfaces de rede, cada uma conectada a uma rede específica. O módulo `firewall` herda as configurações das duas redes e aplica as interfaces de forma adequada. 

Já o `AMI` utilizado para as máquinas de firewall é padronizado para uma imagem robusta no módulo `firewall/base`, garantindo que elas tenham a capacidade e a resiliência necessárias para proteger o ambiente.

Por fim, cada pasta no projeto contém os arquivos `main.tf`, `variables.tf`, e `outputs.tf` específicos. 

- `main.tf` define os recursos a serem criados;
- `variables.tf` permite a customização através de variáveis de entrada;
- `outputs.tf` define as saídas relevantes que serão exibidas após a execução do Terraform; 

Esses arquivos estão organizados para facilitar a manutenção e o entendimento do código, promovendo boas práticas de modularização e reutilização.

