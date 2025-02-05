create database lojinha;

use lojinha;

create table cliente(
id int,
nome varchar(100) not null,
constraint PK_cliente primary key (id));

create table email_cliente(
id int,
email varchar(200),
id_cliente int,
constraint PK_email_cliente primary key (id),
constraint FK_id_cliente foreign key (id_cliente) references cliente(id));

create table pedido(
id int,
data date,
id_cliente int,
constraint PK_id_pedido primary key (id),
constraint FK_id_pedido_cliente foreign key (id_cliente) references cliente(id));

create table produto(
id int,
descricao varchar(200),
id_categoria int,
id_fornecedor int,
estoque int,
constraint PK_id_produto primary key (id));

create table categoria(
id int,
nome varchar(100),
constraint PK_id_categoria primary key (id)); 

create table fornecedor(
id int,
nome varchar(100),
constraint PK_id_fornecedor primary key (id));

alter table produto
add constraint FK_id_categoria foreign key (id_categoria) references categoria(id),
add constraint FK_id_fornecedor foreign key (id_fornecedor) references fornecedor(id);

desc produto;

create table pedido_produto(
id int auto_increment,
id_pedido int not null,
id_produto int not null,
quantidade int,
constraint PK_id_pedido_produto primary key (id),
constraint FK_id_pedido foreign key (id_pedido) references pedido(id),
constraint FK_id_produto foreign key (id_produto) references produto(id));


