create database dbloja;
use dbloja;

create table categoria (
id_categoria int auto_increment,
nome varchar(100),
constraint PK_CategoriaProduto primary key(id_categoria));

create table cliente (
id_cliente int auto_increment,
nome varchar(100),
limite_credito float(5,2),
status varchar(10),
cep varchar(10),
logradouro varchar(200),
numero int,
constraint PK_Cliente primary key(id_cliente));

create table pedido (
id_pedido int auto_increment,
data_pedido date,
total_pedido float(5,2),
id_cliente int not null,
constraint PK_Pedido primary key(id_pedido),
constraint FK_ClientePedido foreign key(id_cliente) references cliente(id_cliente));

create table rl_pedido_produto (
id_produto int not null,
id_pedido int not null,
quantidade int,
constraint PK_PedidoProduto primary key(id_produto,id_pedido),
constraint FK_Pedido foreign key(id_pedido) references pedido(id_pedido),
constraint FK_Produto foreign key(id_produto) references produto(id_produto));

create table produto (
id_produto int auto_increment,
nome varchar(100),
preco float(5,2),
id_categoria int not null,
constraint PK_Produto primary key(id_produto),
constraint FK_ProdutoCategoria foreign key(id_categoria) references categoria(id_categoria));
