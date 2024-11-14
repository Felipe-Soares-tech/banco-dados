use w3schools;

/*
A instrução SQL SELECT
A SELECTinstrução é usada para selecionar dados de um banco de dados.
*/

SELECT CustomerName, City FROM Customers;

/*
A instrução SQL SELECT DISTINCT
A SELECT DISTINCTinstrução é usada para retornar apenas valores distintos (diferentes).
*/

SELECT DISTINCT Country FROM Customers;

/*
A cláusula SQL WHERE
A WHERE cláusula é usada para filtrar registros.
Ele é usado para extrair apenas os registros que atendem a uma condição especificada.
*/

SELECT * FROM Customers WHERE Country='Mexico';

/*
A ORDEM SQL POR
A ORDER BY palavra-chave é usada para classificar o conjunto de resultados em ordem crescente ou decrescente.
*/

SELECT * FROM Products ORDER BY Price;
SELECT * FROM Products ORDER BY Price DESC;
SELECT * FROM Products ORDER BY Price, ProductID;
SELECT * FROM Customers ORDER BY Country ASC, City ASC, CustomerName DESC;

/*
O operador SQL AND
A WHERE cláusula pode conter um ou muitos AND operadores.
O AND operador é usado para filtrar registros com base em mais de uma condição, 
como se você quisesse retornar todos os clientes da Espanha que começam com a letra 'G':
*/

-- Exemplo: Selecione todos os clientes da Espanha que começam com a letra 'G':
SELECT * FROM Customers WHERE Country = 'Spain' AND CustomerName LIKE 'G%';

/*
E vs OU
O ANDoperador exibe um registro se todas as condições forem VERDADEIRAS.
O ORoperador exibe um registro se qualquer uma das condições for VERDADEIRA.
*/

/*
Todas as condições devem ser verdadeiras
A seguinte instrução SQL seleciona todos os campos Customersonde 
Country"Alemanha" E City"Berlim" E PostalCodeé maior que 12000:
*/
SELECT * FROM Customers WHERE Country = 'Germany' AND City = 'Berlin' AND PostalCode > 12000;

/*
Combinando AND e OR
Você pode combinar os operadores AND e .OR
A seguinte instrução SQL seleciona todos os clientes da Espanha que começam com "G" ou "R".
Certifique-se de usar parênteses para obter o resultado correto.
*/

SELECT * FROM Customers WHERE Country = 'Spain' AND (CustomerName LIKE 'G%' OR CustomerName LIKE 'R%');

/*
O operador SQL OR
A WHERE cláusula pode conter um ou mais OR operadores.
O OR operador é usado para filtrar registros com base em mais de uma condição, 
se você quisesse retornar todos os clientes da Alemanha, mas também aqueles da Espanha:
*/

SELECT * FROM Customers WHERE Country = 'Germany' OR Country = 'Spain';

/*
O operador NOT
O NOT operador é usado em combinação com outros operadores para fornecer o resultado oposto, 
também chamado de resultado negativo.
Na instrução select abaixo, queremos retornar todos os clientes que NÃO são da Espanha:
*/

SELECT * FROM Customers WHERE NOT Country = 'Spain';

-- Selecione clientes que não começam com a letra 'A':
SELECT * FROM Customers WHERE CustomerName NOT LIKE 'A%' ORDER BY CustomerName;

/*
O que é um valor NULL?
Um campo com valor NULL é um campo sem valor.
Se um campo em uma tabela for opcional, é possível inserir um novo registro ou atualizar um registro sem adicionar um valor a esse campo. Então, o campo será salvo com um valor NULL.
Nota: Um valor NULL é diferente de um valor zero ou de um campo que contém espaços. Um campo com um valor NULL é aquele que foi deixado em branco durante a criação do registro!
Como testar valores NULL?
Não é possível testar valores NULL com operadores de comparação, como =, < ou <>.
Teremos que usar os operadores IS NULLand IS NOT NULLem vez disso.
*/
UPDATE Customers SET Address = NULL WHERE CustomerID = 3 OR CustomerID = 5;
SELECT * FROM Customers WHERE Address IS NULL;


/*
O operador SQL IN
O INoperador permite que você especifique vários valores em uma WHEREcláusula.
O INoperador é uma abreviação para múltiplas ORcondições.
*/

SELECT * FROM Customers
WHERE Country IN ('Germany', 'France', 'UK');

/*
Função MySQL SUBSTR()
Extraia uma substring de uma string (comece na posição 5, extraia 3 caracteres)
*/

SELECT SUBSTR("SQL Tutorial", 5, 3) AS ExtractString;

/*
Extraia uma substring de uma string (comece do final, na posição -5, extraia 5 caracteres):
*/

SELECT SUBSTR("SQL Tutorial", -5, 5) AS ExtractString;

/*
A cláusula SQL SELECT LIMIT 
A SELECT LIMIT cláusula é usada para especificar o número de registros a serem retornados.
A SELECT LIMIT cláusula é útil em tabelas grandes com milhares de registros. Retornar um grande número de registros pode impactar o desempenho.
*/

SELECT * FROM Customers LIMIT 5;

/*
Funções de agregação SQL
Uma função agregada é uma função que executa um cálculo em um conjunto de valores e retorna um único valor.
Funções agregadas são frequentemente usadas com a GROUP BYcláusula da SELECT instrução. A GROUP BYcláusula divide o conjunto de resultados em grupos de valores e a função agregada pode ser usada para retornar um único valor para cada grupo.
As funções de agregação SQL mais comumente usadas são:
MIN()- retorna o menor valor dentro da coluna selecionada
MAX()- retorna o maior valor dentro da coluna selecionada
COUNT()- retorna o número de linhas em um conjunto
SUM()- retorna a soma total de uma coluna numérica
AVG()- retorna o valor médio de uma coluna numérica
Funções de agregação ignoram valores nulos (exceto para COUNT()).
*/

SELECT MIN(Price), MAX(Price), COUNT(*), SUM(Price), AVG(Price) FROM Products;

SELECT * FROM Customers
WHERE CustomerName LIKE '%mer%';


