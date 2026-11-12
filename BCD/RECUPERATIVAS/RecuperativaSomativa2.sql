-- Active: 1794484718469@@127.0.0.1@3306@retrogame_recuperacao_gabriel
-- RECUPERAÇÃO - RETROGAME
-- Sistema de Locação de Jogos - DDL . DML . DQL . TCL

-- 1. Situação de Aprendizagem

-- A empresa ficticia RetroGame oferece locação de jogos e consoles clássicos dos anos 1980, 1990 e 2000. Atualmente, suas locações são registradas em
-- planilhas, causando divergências de estoque, cadastros repetidos e dificuldade para consultar dientes e jogos. A empresa contratou você para implementar
-- uma primeira versão do banco de dados relacional em MySQL.

-- Missão: criar um banco com cinco tabelas relacionadas, cadastrar dados, atualizar registros elaborar consultas e garantir transações seguras para
-- locação e devolução, A solução deverá demonstrar conhecimentos de DDL, DML, DQL e TCL.

-- --------------------------------------------------------------------------
-- FASE 1 - DDL

-- 1:

CREATE DATABASE IF NOT EXISTS retrogame_recuperacao_gabriel;
USE retrogame_recuperacao_gabriel;

-- 2:

CREATE TABLE IF NOT EXISTS cliente(
    id_cliente INT AUTO_INCREMENT,
    nome_cliente VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    telefone VARCHAR(20) NULL,
    ativo BOOLEAN DEFAULT TRUE,

    CONSTRAINT pk_cliente PRIMARY KEY (id_cliente),
    CONSTRAINT uq_email UNIQUE (email)
);

-- 3:

CREATE TABLE IF NOT EXISTS plataforma(
    id_plataforma INT AUTO_INCREMENT,
    nome_plataforma VARCHAR(80) NOT NULL UNIQUE,

    CONSTRAINT pk_plataforma PRIMARY KEY (id_plataforma),
    CONSTRAINT uq_nome_plataforma UNIQUE (nome_plataforma)
);

CREATE TABLE IF NOT EXISTS categoria(
    id_categoria INT AUTO_INCREMENT,
    descricao VARCHAR(80) NOT NULL UNIQUE,

    CONSTRAINT pk_categoria PRIMARY KEY (id_categoria),
    CONSTRAINT uq_descricao UNIQUE (descricao)
);

-- 4:

CREATE TABLE IF NOT EXISTS jogo(
    id_jogo INT AUTO_INCREMENT,
    titulo VARCHAR(150) NOT NULL,
    codigo VARCHAR(15) NOT NULL UNIQUE,
    ano_lancamento INT NOT NULL,
    quantidade_disponivel INT DEFAULT 0 CHECK (quantidade_disponivel >= 0),

    id_plataforma INT NOT NULL,
    id_categoria INT NOT NULL,

    CONSTRAINT pk_jogo PRIMARY KEY (id_jogo),
    CONSTRAINT fk_jogo_plataforma FOREIGN KEY (id_plataforma) REFERENCES plataforma (id_plataforma),
    CONSTRAINT fk_jogo_categoria FOREIGN KEY (id_categoria) REFERENCES categoria (id_categoria)
);

-- 5:

CREATE TABLE IF NOT EXISTS locacao(
    id_locacao INT AUTO_INCREMENT,
    data_retirada DATETIME DEFAULT CURRENT_TIMESTAMP,
    data_prevista DATE NOT NULL,
    data_devolucao DATE NULL,
    status_locacao VARCHAR(20) DEFAULT 'ABERTA' CHECK (status_locacao in ('ABERTA', 'DEVOLVIDA', 'ATRASADA')),

    id_cliente INT NOT NULL,
    id_jogo INT NOT NULL,

    CONSTRAINT pk_locacao PRIMARY KEY (id_locacao),
    CONSTRAINT fk_locacao_cliente FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente) ON DELETE RESTRICT,
    CONSTRAINT fk_locacao_jogo FOREIGN KEY (id_jogo) REFERENCES jogo (id_jogo) ON DELETE RESTRICT
);

-- 6:

ALTER TABLE jogo ADD desenvolvedora VARCHAR(100);

-- --------------------------------------------------------------------------
-- FASE 2 - DML

-- 7:

INSERT INTO cliente VALUES 
(DEFAULT, 'Francisco Magri', 'chico@email.com', '1999999990', TRUE),
(DEFAULT, 'Luccas Manfredi', 'luccas@email.com', '1999999991', TRUE),
(DEFAULT, 'Franz Kramer', 'franz@email.com', NULL, TRUE),
(DEFAULT, 'Gabriel Nogueira', 'gabriel@email.com', '1999999993', TRUE);

SELECT * FROM cliente;
-- 8:

-- plataformas
INSERT INTO plataforma VALUES 
(DEFAULT, 'Nintendo Switch'),
(DEFAULT, 'PlayStation 5');

SELECT * FROM plataforma;

-- categorias
INSERT INTO categoria VALUES
(DEFAULT, 'Ação e Aventura'),
(DEFAULT, 'RPG');

SELECT * FROM categoria;

-- jogos
INSERT INTO jogo VALUES
(DEFAULT, 'The Legend of Zelda: Ocarina of Time - REMAKE', '10111', 2026, 17, 1, 1, 'Nintendo EPD'),
(DEFAULT, 'Red Dead Redemption 2', '10222', 2018, 25, 2, 1, 'Rockstar'),
(DEFAULT, 'Pokémon: Legends ZA', '10333',2025, 8, 1, 2, 'Game Freak'),
(DEFAULT, 'Spider Man 2', '10444', 2023, 50, 2, 1, 'Marvel'),
(DEFAULT, 'GTA VI', '10555', 2026, 0, 2, 1, 'Rockstar'),
(DEFAULT, 'Super Mario: Odissey', '10666', 2017, 67, 1, 1, 'Nintendo EPD');

SELECT * FROM jogo;

-- 9:

INSERT INTO locacao VALUES
(DEFAULT, NOW(), '2026-12-05', NULL, 'ABERTA', 1, 6),
(DEFAULT, NOW(), '2026-12-05', NULL, 'ABERTA', 2, 5),
(DEFAULT, NOW(), '2026-12-05', NULL, 'ABERTA', 3, 4);

SELECT * FROM locacao;

-- 10:

SELECT id_cliente, telefone
FROM cliente
WHERE telefone is NULL;

UPDATE cliente
SET telefone = '1999999992'
WHERE id_cliente = 3;

SELECT id_cliente, telefone
FROM cliente
WHERE id_cliente = 3;

-- 11:

SELECT titulo, quantidade_disponivel FROM jogo;

UPDATE jogo
SET quantidade_disponivel = quantidade_disponivel + 2
WHERE ano_lancamento >= 2000;

SELECT titulo, quantidade_disponivel FROM jogo;

-- 12:

INSERT INTO cliente VALUES (DEFAULT, 'temporario', 'temporario@email.com', '19999999994', FALSE);

SELECT * FROM cliente;
set @ultimo_cliente = LAST_INSERT_ID();

-- Deletando usuario novo criado 
DELETE FROM cliente
WHERE id_cliente = @ultimo_cliente;

SELECT * FROM cliente;

-- Deletando usuario com locacao
DELETE FROM cliente
WHERE id_cliente = 1;

-- Resposta:
-- O erro exibido foi:
-- Cannot delete or update a parent row: a foreign key constraint fails (retrogame_recuperacao_gabriel'. ` locacao', CONSTRAINT fk_locacao_cliente' FOREIGN KEY ( id_id_cliente` ) REFERENCES cliente (`id_cliente'))
-- Isso significa que não é possível excluir ou atualizar um usuario que possui uma locacao, graças a uma restrição de chave estrangeira dada pelo constraint.

-- --------------------------------------------------------------------------
-- FASE 3 - DQL

-- 13:

SELECT titulo, ano_lancamento, quantidade_disponivel
FROM jogo;

-- 14:

SELECT titulo, quantidade_disponivel FROM jogo
WHERE quantidade_disponivel > 2
ORDER BY quantidade_disponivel DESC; 

-- 15:

SELECT titulo, ano_lancamento FROM jogo
WHERE titulo LIKE '%red%';

-- 16:

SELECT titulo, ano_lancamento FROM jogo
WHERE ano_lancamento BETWEEN 2020 AND 2026;

-- 17:

-- Quantidade de titulos de jogos disponiveis
SELECT COUNT(quantidade_disponivel) AS QUANTIDADE_JOGOS
FROM jogo;

-- Quantidade total de jogos disponiveis
SELECT SUM(quantidade_disponivel) as TOTAL_JOGOS
FROM jogo;

-- Resumo de menor, maior e a media de jogos em estoque
SELECT ROUND(MIN(quantidade_disponivel)) AS MENOR_ESTOQUE,
    ROUND(MAX(quantidade_disponivel)) AS MAIOR_ESTOQUE,
    ROUND(AVG(quantidade_disponivel)) AS MEDIA_ESTOQUE
FROM jogo;

-- 18:

SELECT l.id_locacao, c.nome_cliente AS cliente, j.titulo AS jogo, l.data_retirada, l.status_locacao
FROM locacao as l
INNER JOIN cliente as c
ON l.id_cliente = c.id_cliente
INNER JOIN jogo as j
ON l.id_jogo = j.id_jogo
ORDER BY l.id_locacao;

-- 19:

-- Adicionando uma locacao com status 'devolvida' pois não tenho nenhuma
INSERT INTO locacao VALUES (DEFAULT, NOW(), '2026-11-15', '2026-11-17', 'DEVOLVIDA', 4, 3);

SELECT l.id_locacao, c.nome_cliente AS cliente, j.titulo AS jogo, l.data_retirada, l.status_locacao
FROM locacao as l
INNER JOIN cliente as c
ON l.id_cliente = c.id_cliente
INNER JOIN jogo as j
ON l.id_jogo = j.id_jogo
WHERE l.status_locacao = 'ABERTA'
ORDER BY l.id_locacao;

-- 20:

-- Vou adicionar mais uma locacao a alguem que ja tenha
INSERT INTO locacao VALUES (DEFAULT, NOW(), '2026-11-15', NULL, 'ABERTA', 1, 2);

SELECT c.nome_cliente AS cliente, COUNT(l.id_locacao) AS QUANTIDADE_LOCACOES
FROM cliente AS c
INNER JOIN locacao AS l
ON l.id_cliente = c.id_cliente
GROUP BY c.id_cliente, c.nome_cliente
ORDER BY QUANTIDADE_LOCACOES DESC;

-- 21: 

-- Vou adicionar um usuario porem que não possua locacoes
INSERT INTO cliente VALUES (DEFAULT, 'Davi Ferreira', 'davi@email.com', '1999999995', TRUE);

SELECT c.nome_cliente, l.id_locacao, l.data_retirada
FROM cliente as c
LEFT JOIN locacao as l 
ON l.id_cliente =  c.id_cliente
ORDER BY c.nome_cliente;

-- --------------------------------------------------------------------------
-- FASE 4 - TCL

-- 22:

START TRANSACTION;

SELECT id_jogo, quantidade_disponivel FROM jogo
WHERE id_jogo = 1;

INSERT INTO locacao VALUES (DEFAULT, NOW(), '2026-11-15', NULL, 'ABERTA', 2, 1);

UPDATE jogo
SET quantidade_disponivel = quantidade_disponivel - 1
WHERE id_jogo = 1;


SELECT id_jogo, quantidade_disponivel FROM jogo
WHERE id_jogo = 1;

COMMIT;

-- 23:

START TRANSACTION;

SELECT id_jogo, quantidade_disponivel FROM jogo
WHERE id_jogo = 2;

UPDATE jogo
SET quantidade_disponivel = 67
WHERE id_jogo = 2;

SELECT id_jogo, quantidade_disponivel FROM jogo
WHERE id_jogo = 2;

ROLLBACK;

SELECT id_jogo, quantidade_disponivel FROM jogo
WHERE id_jogo = 2;

-- 24:

START TRANSACTION;

-- verificando quantidade atual no jogo de id 3
SELECT id_jogo, quantidade_disponivel FROM jogo
WHERE id_jogo = 3;

-- alterando a quantidade no jogo de id 3 de 10 para 15
UPDATE jogo
SET quantidade_disponivel = 15
WHERE id_jogo = 3;

-- verificando novamente a quantidade no jogo de id 3
SELECT id_jogo, quantidade_disponivel FROM jogo
WHERE id_jogo = 3;

-- salvando savepoint apos mudar a quantidade no jogo de id 3
SAVEPOINT alteracao_id_3;

-- verificando quantidade atual no jogo de id 4
SELECT id_jogo, quantidade_disponivel FROM jogo
WHERE id_jogo = 4;

-- alterando a quantidade no jogo de id 4 de 52 para 115
UPDATE jogo
SET quantidade_disponivel = 115
WHERE id_jogo = 4;

-- verificando novamente a quantidade no jogo de id 4
SELECT id_jogo, quantidade_disponivel FROM jogo
WHERE id_jogo = 4;

-- retornando ao ponto de salvamento
ROLLBACK TO SAVEPOINT alteracao_id_3;

-- verificando novamente a quantidade no jogo de id 4
SELECT id_jogo, quantidade_disponivel FROM jogo
WHERE id_jogo = 4;

-- finalizando Transaction
COMMIT;

-- 25:

START TRANSACTION;

SELECT id_locacao, id_jogo, id_cliente, status_locacao FROM locacao
WHERE status_locacao = 'ABERTA';

UPDATE locacao
SET 
    status_locacao = 'DEVOLVIDA',
    data_devolucao = NOW()
WHERE id_locacao = 6;

UPDATE jogo
SET quantidade_disponivel = quantidade_disponivel + 1
WHERE id_jogo = 1;

SELECT * FROM locacao;
SELECT quantidade_disponivel FROM jogo 
WHERE id_jogo = 1;

COMMIT;

-- --------------------------------------------------------------------------
-- ANALISE TECNICA

-- A) REGRA DE APLICACAO: UNIQUE
-- B) REGRA DE APLICACAO: UNIQUE
-- C) REGRA DE APLICACAO: CHECK
-- D) INTEGRIDADE REFERENCIAL
-- E) CONTRAINT FK
-- F) INTEGRIDADE REFERENCIAL
-- G) INTEGRIDADE REFERENCIAL



-- Excluindo banco para testar tudo de novo
DROP DATABASE retrogame_recuperacao_gabriel;