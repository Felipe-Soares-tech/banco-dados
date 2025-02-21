use pizzaria;
SELECT User, Host FROM mysql.user;

create user'luiz-maia'@'%' identified by 'senai@123';

-- 172.16.7.176

select * from au_pizza;

DELIMITER $$

CReaTE TRIGGER depois_insert_pizza
after insert on pizza
for each row
begin
	insert into au_pizza(id_pizza, sabor, ingredientes, usuario, data_hora, operacao)
    values (new.id_pizza, new.sabor, new.ingredientes, user(), now(), 'insert');
end$$

delimiter ;

GRANT INSERT, SELECT, UPDATE ON pizzaria.pizza TO 'luiz-maia'@'%';

select * from pizza;

select * from au_pizza;