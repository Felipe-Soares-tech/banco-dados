import requests
import mysql.connector


# endereço de onde vamos acessar
url = 'https://servicodados.ibge.gov.br/api/v1/localidades/estados'

response = requests.get(url)

obj = response.json()
lista = obj

def banco(sql):
    conexao = mysql.connector.connect(
        host = 'localhost',
        database = 'pizzaria',
        user = 'root',
        password = 'senai@123'
    )
    cursor = conexao.cursor()
    cursor.execute(sql)
    conexao.commit()
    cursor.close()
    conexao.close()

# loop para mostrar todos os itens
i = 0
while i < len(lista):
    
    id = lista[i]['id']
    sigla = lista[i]['sigla']
    nome = lista[i]['nome']
    regiao = lista[i]['regiao']['id']
    print(f'{id} - {sigla} - {nome} - {regiao}')

    sql = f"INSERT INTO estados(id_estado, sigla, nome, id_regiao) VALUES('{id}','{sigla}','{nome}', '{regiao}');"
    banco(sql)
    i += 1
