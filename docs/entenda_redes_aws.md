# Entenda redes na AWS

Na 


## Os objetos a serem configurados na AWS

- **VPC (Virtual Private Cloud)**: É uma rede virtual dedicada à sua conta AWS onde você pode lançar recursos da AWS, como instâncias EC2. A VPC é o recurso mais macro disponível e serve como uma espécie de 'container de recursos de rede' na AWS.

- **Subnet**: É uma divisão lógica dentro de uma VPC que define um bloco de endereços IP. As subnets podem ser públicas (com acesso à internet) ou privadas (sem acesso direto à internet).

- **Route Table**: Define as regras de roteamento para subnets dentro de uma VPC. Ela determina como o tráfego é direcionado, tanto dentro da VPC quanto para fora dela, como para a internet.

- **Gateway**: Pode ser um Internet Gateway (para permitir que instâncias em uma VPC se comuniquem com a internet) ou um NAT Gateway (para permitir que instâncias privadas façam solicitações de saída para a internet).

- **DHCP Options Set**: Define configurações de rede, como o servidor DNS e o nome do domínio, para instâncias dentro da VPC. Ele controla como os endereços IP são atribuídos dinamicamente.

- **ACL (Access Control List)**: É uma camada de segurança adicional para subnets que controla o tráfego de entrada e saída ao nível da subnet, operando como um firewall stateless.

- **Security Group**: Atua como um firewall virtual para suas instâncias EC2, controlando o tráfego de entrada e saída com base em regras definidas, e é aplicado no nível da instância.

