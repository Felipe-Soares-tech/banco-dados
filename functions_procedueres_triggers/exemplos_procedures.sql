use campeonatobrasileiro;
SET SQL_SAFE_UPDATES=0;
DELIMITER $$
	CREATE PROCEDURE adicionar_usuario(nome VARCHAR(100), email VARCHAR(100))
    BEGIN
		INSERT INTO usuarios (nome, email) VALUES (nome, email);
	END$$
DELIMITER ;

CALL adicionar_usuario('João Silva','joao@gmail.com');
CALL adicionar_usuario('Luiz Felipe','luiz@gmail.com');
CALL adicionar_usuario('Elon Musk','elon@gmail.com');

SELECT * FROM usuarios;

DELIMITER $$
	CREATE PROCEDURE contar_usuarios(OUT quantidade INT)
    BEGIN
		SELECT count(*) INTO quantidade FROM usuarios;
	END$$
DELIMITER ;

CALL contar_usuarios(@total);
select @total;

DELIMITER $$
	CREATE PROCEDURE atualizar_email(id_usuario INT, novo_email VARCHAR(100))
    BEGIN
		IF EXISTS (SELECT 1 FROM usuarios WHERE id = id_usuario) THEN
        UPDATE usuarios SET email = novo_email WHERE id = id_usuario;
	ELSE
		SIGNAL SQLSTATE '45000' SET message_text = 'Usuário não encontrado';
	END IF;
END$$
DELIMITER ;

CALL atualizar_email (5,'novo_email@gmail.com');
CALL atualizar_email (1,'novo_email@gmail.com');

select * from usuarios;

DELIMITER $$
	CREATE PROCEDURE atualizar_gol_partida(m_sigla VARCHAR(3), m_gol INT, v_gol INT, v_sigla VARCHAR(3))
    BEGIN 
		DECLARE idpartida INT;
		UPDATE partida SET gol_mandante = m_gol, gol_visitante = v_gol
        where id_partida = (SELECT id_partida FROM partida
							WHERE id_mandante = (SELECT id_time FROM time where sigla = m_sigla) and
								  id_visitante = (SELECT id_time FROM time where sigla = v_sigla));
		UPDATE partida SET gol_mandante = m_gol, gol_visitante = v_gol where id_partida = idpartida;
	END$$
DELIMITER ;
drop procedure atualizar_gol_partida;
select * from time;

