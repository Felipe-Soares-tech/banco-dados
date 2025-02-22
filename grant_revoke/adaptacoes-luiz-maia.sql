use pizzaria;

select * from pizza;

select * from au_pizza;

insert into pizza(sabor, ingredientes)
    values('chocolate', 'chocolate e queijo');
    
UPDATE pizza
SET sabor = 'chocolate branco', ingredientes = 'chocolate branco e queijo'
WHERE id_pizza = 2;

insert into pizza(sabor, ingredientes)
    values('calabresa', 'calabresa e queijo');
    
DELETE FROM pizza WHERE id_pizza = 3;

select * from au_pizza;