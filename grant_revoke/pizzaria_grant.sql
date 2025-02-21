SELECT User, Host FROM mysql.user;

CREATE USER 'novo-usuario'@'localhost' identified BY 'senai@123';

create database pizzaria;
GRANT ALL privileges on pizzaria.* to 'novo-usuario'@'localhost';

REVOKE CREATE ON  pizzaria.* from 'novo-usuario'@'localhost';

