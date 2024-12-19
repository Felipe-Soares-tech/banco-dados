use campeonatobrasileiro;

DELIMITER $$
	CREATE TRIGGER antes_de_inserir_usuario
    BEFORE INSERT ON usuarios
    FOR EACH ROW
    BEGIN
		IF NEW.nome IS NULL OR NEW.nome = '' THEN
			SET NEW.nome = 'Nome Padrão';
		END IF;
	END$$
DELIMITER ;

select * from usuarios;
CALL adicionar_usuario('','teste@trigger.com');
select * from usuarios;

DELIMITER $$
	CREATE TRIGGER apos_atualizar_usuario
    AFTER UPDATE ON usuarios
    FOR EACH ROW
    BEGIN
		INSERT INTO auditoria_usuarios VALUES(null, old.id, old.nome, old.email, 'update', NOW());
	END$$
DELIMITER ;

select * from usuarios;
UPDATE usuarios SET nome = 'Bill Gates', email = 'bill@microsoft.com' WHERE id = 4;
UPDATE usuarios SET nome = 'Chapolin Colorado', email = 'chapolin@microsoft.com' where id = 5;
select * from auditoria_usuarios;

DELIMITER $$
	CREATE TRIGGER antes_de_excluir_usuario
    BEFORE DELETE ON usuarios
    FOR EACH ROW
    BEGIN
		IF OLD.id = 1 THEN
			SIGNAL SQLSTATE '45000'
            SET message_text = 'Não é permitido excluir o usuário administrador';
            END IF;
	END$$
DELIMITER ;

DELETE FROM usuarios where id = 1;
