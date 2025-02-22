use pizzaria;

delimiter $$

create TRIGGER depois_update_pizza
after update on pizza
for each row
begin

insert into au_pizza(id_pizza, sabor, ingredientes, usuario, data_hora, operacao)
    values (old.id_pizza, old.sabor, old.ingredientes, user(), now(), 'insert');

end$$

delimiter ;

delimiter $$

create trigger antes_delete
after delete on pizza
for each row
begin

insert into au_pizza(id_pizza, sabor, ingredientes, usuario, data_hora, operacao)
    values (old.id_pizza, old.sabor, old.ingredientes, user(), now(), 'insert');

end$$

delimiter ;

GRANT INSERT, SELECT, UPDATE, delete ON pizzaria.pizza TO 'luiz-maia'@'%';
GRANT INSERT, SELECT, UPDATE, delete ON pizzaria.au_pizza TO 'luiz-maia'@'%';
select * from au_pizza;