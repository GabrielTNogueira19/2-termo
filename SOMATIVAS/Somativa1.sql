CREATE DATABASE IF NOT EXISTS Oficina_Gabriel;

USE oficina_Gabriel;

CREATE TABLE if NOT exists Clientes(
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome_cliente VARCHAR(60) NOT NULL,
    cpf_cliente CHAR(14) NOT NULL UNIQUE
)