create database dbmaternidade;
use dbmaternidade;
create table mae (
id_mae int auto_increment,
rg varchar(10),
endereco varchar(200),
telefone varchar(20),
dt_nascimento date,
constraint PK_MaeBebe primary key (id_mae));

create table bebe (
id_bebe int auto_increment,
nome varchar(100),
dt_nascimento date,
peso float(5,2),
altura int,
crm int not null,
id_mae int not null,
constraint PK_Bebe primary key (id_bebe),
constraint FK_MaeBebe foreign key(id_mae) references mae(id_mae),
constraint FK_MedicoBebe foreign key(crm) references medico(crm));

create table medico (
crm int,
nome varchar(120),
telefone varchar(20),
especialidade varchar(100),
constraint PK_MedicoBebe primary key(crm));


