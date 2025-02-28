import requests
import mysql.connector


# endereço de onde vamos acessar
url = 'https://servicodados.ibge.gov.br/api/v1/localidades/municipios'

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
    nome = lista[i]['nome'].replace("'"," ")
    idestado = lista[i]['microrregiao']['mesorregiao']['UF']['id']
    print(f'{id} - {nome} - {idestado}')

    sql = f"INSERT INTO municipios(id_municipio, nome, id_estado) VALUES('{id}','{nome}', '{idestado}');"
    banco(sql)
    i += 1
