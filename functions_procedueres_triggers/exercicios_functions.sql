use campeonatobrasileiro;
DELIMITER $$

CREATE FUNCTION valor_aleatorio(min INT, max INT)
RETURNS INT
NOT DETERMINISTIC
READS SQL DATA
BEGIN
	RETURN ROUND(RAND()*(max-min))+min;
END$$

DELIMITER ;

select valor_aleatorio(1,4);


DELIMITER $$
CREATE FUNCTION signo(dt date)
RETURNS VARCHAR (20)
DETERMINISTIC
BEGIN
	IF date_format(dt,'%m%d') BETWEEN '0321' AND '0419'	THEN
		RETURN 'Áries'
	END IF;
    IF 