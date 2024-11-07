use dbclinica;
CREATE TABLE `mae` (
   `id_mae` int NOT NULL AUTO_INCREMENT,
   `rg` varchar(10) DEFAULT NULL,
   `endereco` varchar(200) DEFAULT NULL,
   `telefone` varchar(20) DEFAULT NULL,
   `dt_nascimento` date DEFAULT NULL,
   PRIMARY KEY (`id_mae`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
 
 