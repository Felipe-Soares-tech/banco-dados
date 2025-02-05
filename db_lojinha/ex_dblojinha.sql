use lojinha;

insert into cliente (id,nome)
values 
(01, 'Ana'),
(02, 'José'),
(03, 'João');

select * from cliente;
update email_cliente set id = 7
where id = 06;
insert into email_cliente(id, email, id_cliente)
values
(01, 'e1', 1),
(02, 'e2', 1),
(03, 'e3', 2),
(04, 'e4', 2),
(05, 'e5', 3);

select * from email_cliente;

insert into pedido(id, data, id_cliente)
values
(1, '2015-10-05', 1),
(2, '2014-12-31', 1),
(3, '2010-09-10', 2),
(4, '2015-03-14', 2),
(5, '2014-07-21', 2);

select * from pedido;    

insert into categoria(id, nome)
values
(1, 'Ferramenta'),
(2, 'Vestuário'),
(3, 'Alimento');

select * from categoria;

insert into fornecedor(id, nome)
values 
(1, 'F1'),
(2, 'F2'),
(3, 'F3');

select * from fornecedor;

insert into produto(id, descricao, id_categoria, id_fornecedor, estoque)
values
(1, 'Alicate', 1, 1, 10),
(2, 'Leite', 2, 1, 100),
(3, 'Suco', 2, 1, 50),
(4, 'Camisa', 3, 2, 40),
(5, 'Calça', 3, 2, 20);

select * from produto;

insert into pedido_produto(id, id_pedido, id_produto, quantidade)
values
(1, 1, 1, 10),
(2, 1, 2, 20),
(3, 2, 3, 5),
(4, 3, 4, 10),
(5, 4, 5, 5);

select * from pedido_produto;

-- EXERCICIOS

-- a) Mostre todos os clientes com seus e-mails organizados pelo nome do cliente
select nome, email
from cliente c
inner join email_cliente ec
on c.id = ec.id_cliente;

-- b) Mostre todos os pedidos realizados entre 2010 e 2014 
select * from pedido
where year(data) between 2010 and 2014
order by data asc;

-- c) Mostre todos os clientes que possuem pedidos entre 2015 e 2016 

select * from pedido as p
inner join cliente c
on p.id_cliente = c.id
where year(data) between 2015 and 2016;

-- d) Mostre o nome das categorias que iniciam pela letra f, organizadas pelo nome da categoria de forma descendente, sem valores repetidos 
select * from categoria
where nome like 'f%'
order by nome desc;

-- e) Apresente o total de produtos que são da categoria Vestuário

select * from produto p
inner join categoria c on p.id_categoria = c.id
where nome = 'Vestuário';

-- f) Mostre o nome da categoria e o total em estoque de cada produto agrupado por categoria 
select nome, sum(estoque) total
from produto p
inner join categoria c on p.id_categoria = c.id
group by nome;

select estoque, descricao from produto;

-- g) Mostre o nome do produto com o nome do respectivo fornecedor 
select nome, descricao
from produto p
inner join fornecedor f
on p.id_fornecedor = f.id;


-- h) Para o cliente com id=01, mostre a data de todos os pedidos efetuados classificados pela data do pedido 
select c.id, data
from cliente c
inner join pedido p
on c.id = p.id_cliente
where c.id = 1;


 -- i) Liste a descrição e a quantidade pedida de cada produto 
 select * from produto p
 inner join pedido_produto pp on p.id = pp.id_produto
 group by
 descricao;
-- j) Na tabela produto, insira um novo campo chamado preco do tipo decimal(5,2). Utilize o comando update e atribua 10% do valor do estoque do produto para este novo campo (preco), ou seja, para estoque igual a 100, o preco deverá ser de 10.  
alter table produto
add preco decimal(5,2);

update produto set preco = estoque * 0.1
where id > 0;
select * from produto;

-- k) Na tabela produto, informe o maior valor de estoque 
select max(estoque) maior_estoque from produto;