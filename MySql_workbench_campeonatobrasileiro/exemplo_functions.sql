use campeonatobrasileiro;
	
DELIMITER $$
	CREATE FUNCTION quadrado(num INT)
    RETURNS INT
    DETERMINISTIC
    BEGIN
		RETURN  num * num;
    END$$
    
    DELIMITER ;
    
    SELECT quadrado(4);
    
    DELIMITER $$
    CREATE FUNCTION eh_par(num INT)
    RETURNS VARCHAR(10)
    DETERMINISTIC
	BEGIN
		IF num % 2 = 0 THEN
			RETURN 'PAR';
		ELSE
			RETURN 'ÍMPAR';
		END IF;
	END$$
    
    DELIMITER ;
    
select eh_par(11), eh_par(10);

DELIMITER $$
	CREATE FUNCTION idade(dt DATE)
    RETURNS INT
    NOT DETERMINISTIC
    READS SQL DATA
    BEGIN
		RETURN datediff(curdate(), dt) div 365.25;
	END$$
    
    DELIMITER ;
    
select idade(dt_nascimento) from jogador;

DELIMITER $$
	CREATE FUNCTION faixa_etaria(dt DATE)
    RETURNS VARCHAR(20)
    NOT DETERMINISTIC
    READS SQL DATA
    BEGIN
		DECLARE fx_etaria INT;
        SET fx_etaria = (SELECT idade(dt) div 10);
        RETURN concat('entre ', fx_etaria, '0 e ',fx_etaria, '9');
	END$$

DELIMITER ;

select distinct faixa_etaria(dt_nascimento) from jogador;
drop function faixa_etaria;