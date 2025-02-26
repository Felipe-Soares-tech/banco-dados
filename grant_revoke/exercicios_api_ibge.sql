SET SQL_SAFE_UPDATES = 0;
use pizzaria;
select * from pizza;
ALTER TABLE pizza
ADD COLUMN preco DECIMAL(5,2);

UPDATE pizza
 SET sabor = NULL, ingredientes = NULL;
 
 delete from pizza where id_pizza > 0;

create table regioes(
id_regiao int primary key,
sigla varchar(2) null,
nome varchar(100));

create table estados(
id_estado int primary key,
sigla varchar(2) null,
nome varchar(100),
id_regiao int,
foreign key(id_regiao) references regioes(id_regiao));

create table municipios(
id_municipio int primary key,
nome varchar(100),
id_estado int,
foreign key(id_estado) references estados(id_estado));
-- id
drop table estados;
-- sigla // quando tiver
-- nome
-- id_<outra_tb> // quando tiver