use pizzaria;
drop table au_pizza;
create table au_pizza(
id_aupizza int auto_increment primary key,
id_pizza int,
sabor varchar(250),
ingredientes varchar(250),
usuario varchar(100),
data_hora datetime,
operacao varchar(10));

DELIMITER $$
CReaTE TRIGGER depois_insert_pizza
after insert on pizza
for each row
begin
	insert into au_pizza(id_pizza, sabor, ingredientes, usuario, data_hora, operacao)
    values (new.id_pizza, new.sabor, new.ingredientes, user(), now(), 'insert');
end$$

DELIMITER ;

show triggers;
drop trigger depois_insert_pizza;