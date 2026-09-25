-- Active: 1788519225521@@127.0.0.1@3306@smartcoffee_dml_gabriel
DROP DATABASE if EXISTS smartcoffee_dml_gabriel;

CREATE DATABASE IF NOT EXISTS smartcoffee_dml_gabriel;

USE smartcoffee_dml_gabriel;

CREATE TABLE cliente(
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL,
    telefone VARCHAR(15),
    cidade VARCHAR(60) NOT NULL,
    ativo BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE categoria(
    id_categoria INT PRIMARY KEY AUTO_INCREMENT ,
    nome VARCHAR(60) NOT NULL
);

-- Inserindo dados no Banco de Dados

INSERT INTO cliente (nome, email, telefone, cidade, ativo) VALUES
('Arthur Nunes', 'arthur@email.com', '19999999901', 'Rondonia', TRUE),
('Beatriz Raissa', 'beatriz@email.com', '19999999902', 'Limeira', TRUE),
('Dandara Dias', 'dandara@email.com', '19999999000', 'Limeira', TRUE),
('Davi Ferreira', 'davi@email.com', NULL, 'Limeira', TRUE),
('Felipe Rodrigues', 'Felipe@email.com', NULL, 'Limeira', TRUE),
('Francisco Magri', 'chico@email.com', '19999999903', 'Limeira', TRUE),
('Franz Kramer', 'franz@email.com', '19999999904', 'Limeira', TRUE),
('Gabriel Travaglini', 'gabriel.tnogueira19@gmail.com', '(19)98121-4475', 'Limeira', TRUE),
('Gabrielli Araujo', 'gabrielli@email.com', '19999999905', 'Americana', TRUE),
('Isabella Alves', 'isabella@email.com', NULL, 'Limeira', TRUE),
('Keynan Santos', 'keynan@email.com', '199999999906', 'Santos', TRUE),
('Larissa Ramires', 'larissa@email.com', '199999999907', 'Limeira', TRUE),
('Leonardo Dias', 'leonardo@email.com', '199999999908', 'Valinhos', TRUE),
('Luana Lima', 'luana@email.com', '199999999909', 'Limeira', TRUE),
('Livia Stein', 'Livia@email.com', '19999999900', 'Limeira', TRUE),
('Luccas Manfredi', 'luccas@email.com', '199999999910', 'Campinas', TRUE);

INSERT INTO categoria (nome) VALUES ('Café'),
('Bebidas Geladas'),
('Bebidas Quentes'),
('Salgados'),
('Sobremesas'),
('Combo');


-- Verificar ultimo insert inserido
INSERT INTO categoria (nome) VALUES ('Doces');

SET @categoria = LAST_INSERT_ID();
SELECT @categoria;


-- Atualizando ou modificando dados no Banco de Dados
-- EX1: Modificando Valores Induviduais
UPDATE cliente
SET telefone = '19888999901'
WHERE id_cliente = 10;

-- Lembrar de sempre executar o select para atualizar (update)
-- E nunca fazer um update sem where
UPDATE cliente
SET telefone = '0000000000';

-- EX2: Modificando Varios Valores
UPDATE cliente
SET telefone = '19888999911', cidade = 'Piracicaba'
WHERE id_cliente = 10;

-- EX3: Apagar Dados da Tabela
DELETE FROM cliente
WHERE id_cliente = 10;


-- Visualizar Banco de Ddados
SELECT * FROM cliente
WHERE id_cliente = 10;
SELECT * FROM categoria;