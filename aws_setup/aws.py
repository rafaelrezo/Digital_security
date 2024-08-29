import os
import subprocess
import sys

# Função para verificar se o AWS CLI está instalado
def check_aws_cli_installed():
    try:
        # Executa o comando 'aws --version' para verificar se o AWS CLI está instalado
        result = subprocess.run(["aws", "--version"], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        if result.returncode == 0:
            print("AWS CLI está instalado.")
        else:
            print("AWS CLI não está instalado. Por favor, instale o AWS CLI antes de continuar.")
            sys.exit(1)
    except FileNotFoundError:
        print("AWS CLI não está instalado. Por favor, instale o AWS CLI antes de continuar.")
        sys.exit(1)

# Verificar se o AWS CLI está instalado
check_aws_cli_installed()

# Perguntar ao usuário os valores das credenciais
aws_access_key_id = input("Digite o AWS Access Key ID: ")
aws_secret_access_key = input("Digite o AWS Secret Access Key: ")
aws_session_token = input("Digite o AWS Session Token (pressione Enter se não houver): ")

# Configurar as credenciais na AWS CLI
os.system(f"aws configure set aws_access_key_id {aws_access_key_id}")
os.system(f"aws configure set aws_secret_access_key {aws_secret_access_key}")
os.system(f"aws configure set aws_session_token {aws_session_token}")

print("Credenciais AWS configuradas com sucesso.")
