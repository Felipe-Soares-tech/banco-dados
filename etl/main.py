import requests
import mysql.connector
# endereço de onde vamos acessar
url = 'https://api.anota.ai/clientauth/nm-category/menu-merchant?displaySources=DIGITAL_MENU'
# token de autorização
headers = {
'Authorization':'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZHBhZ2UiOiI2NGY4ZTUwZGRlYTRkNDAwMTI2OTlmMzMiLCJpYXQiOjE3NDA0MzY1MjV9.1gVifEqcqqovYbk0Yj0cmqN27hvhUvQ4D4EoKak1N5g'
}
# execução da requisição
response = requests.get(url, headers=headers)

# mostrar o retorno
# print(response.json())

obj = response.json()
lista = obj['data']['menu']['menu'][1]['itens']

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
    titulo = lista[i]['title']
    descricao = lista[i]['description']
    print(f'{titulo} - {descricao}')
    #
    sql = f"INSERT INTO pizza(sabor, ingredientes) VALUES('{titulo}','{descricao}');"
    banco(sql)
    i += 1






# instalar o request no bash com 'pip install requests'

