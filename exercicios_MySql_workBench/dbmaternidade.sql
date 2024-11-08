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

alter table bebe add column medico varchar (100);
alter table bebe add column mae varchar (100);

create table medico (
crm int,
nome varchar(120),
telefone varchar(20),
especialidade varchar(100),
constraint PK_MedicoBebe primary key(crm));

alter table mae add column nome varchar(100);

insert into medico(crm,nome,telefone,especialidade) values
(1010,'Dr.João Silva','(11)92345-6789','Pediatra'),
(1020,'Dra.Maria Oliveira','(71)98765-4321','Pediatra'),
(1030,'Dr.Carlos Santos','(21)91234-5678','Pediatra');

insert into mae(nome,rg,endereco,telefone,dt_nascimento) values
('Eliana','1234567890','Rua das Flores,100,São Paulo,SP','(11)91234-5678','1973-11-22'),
('Ivete Sangalo','2345678901','Av. Oceânica,200,Salvador,BA','(71)99876-5432','1972-05-27'),
('Claudia Leitte','3456789012','Rua das Estrelas,300,Rio de Janeiro,RJ','(21)98765-4321','1980-07-10'),
('Nívea Stelmann','4567890123','Alameda das Palmeiras,150,Niterói,RJ','(21)91234-1234','1974-04-06'),
('Andréa Sorvetão','5678901234','Rua do Sol,50,São Paulo,SP','(11)92345-6789','1973-10-01'),
('Simone Mendes','6789012345','Rua Sertaneja,500,Goiânia,GO','(62)93456-7890','1984-05-24'),
('Samara Felippo','7890123456','Rua dos Artistas,250,Rio de Janeiro,RJ','(21)95678-4321','1978-10-06');

insert into bebe(nome,dt_nascimento,peso,altura,medico,mae) values
('Giovanna','1997-02-02','3.50','50','Dr.Carlos Santos','Andréa Sorvetão'),
('Stephanie','1999-06-05','3.45','49','Dra.Maria Oliveira','Andréa Sorvetão'),
('Felipe','2003-11-15','3.55','51','Dra.Maria Oliveira','Andréa Sorvetão'),
('Miguel','2004-07-11','3.30','49','Dr.Carlos Santos','Nívea Stelmann'),
('Davi','2009-01-20','3.45','50','Dr.Carlos Santos','Claudia Leitte'),
('Alícia','2009-07-28','3.40','49','Dra.Maria Oliveira','Samara Felippo'),
('Marcelo','2009-10-02','3.60','52','Dr.Carlos Santos','Ivete Sangalo'),
('Arthur','2011-08-10','3.50','50','Dr.João Silva','Eliana'),
('Rafael','2012-08-15','3.55','51','Dr.João Silva','Claudia Leitte'),
('Lara','2013-05-15','3.20','47','Dr.Carlos Santos','Samara Felippo'),
('Henry','2014-02-03','3.60','50','Dra.Maria Oliveira','Simone Mendes'),
('Bruna','2014-04-10','3.10','47','Dr.Carlos Santos','Nívea Stelmann'),
('Manuela','2017-09-10','3.20','48','Dra.Maria Oliveira','Eliana'),
('Helena','2018-02-10','3.35','49','Dra.Maria Oliveira','Ivete Sangalo'),
('Marina','2018-02-10','3.40','49','Dr.João Silva','Ivete Sangalo'),
('Bela','2019-08-20','3.25','48','Dra.Maria Oliveira','Claudia Leitte'),
('Zaya','2021-02-22','3.30','48','Dr.João Silva','Simone Mendes');
