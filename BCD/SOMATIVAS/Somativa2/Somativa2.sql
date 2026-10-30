-- Active: 1788519225521@@127.0.0.1@3306@biblioteca_som2_gabriel
-- ATIVIDADE SOMATIVA — SISTEMA DE GERENCIAMENTO DE BIBLIOTECA

-- -------------------------------------------------------------------
-- FASE 1 — DDL: CRIAÇÃO E ESTRUTURA

-- 1. Criação do banco
DROP DATABASE IF EXISTS biblioteca_som2_gabriel;
CREATE DATABASE biblioteca_som2_gabriel;
USE biblioteca_som2_gabriel;

-- 2. Tabela USUARIO

CREATE TABLE usuario(
    id_usuario INT AUTO_INCREMENT,
    nome_usuario VARCHAR(100) NOT NULL,
    email_usuario VARCHAR(120) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    ativo BOOLEAN DEFAULT TRUE,

    CONSTRAINT pk_usuario PRIMARY KEY (id_usuario)
);

-- 3. Tabela LIVRO

CREATE TABLE livro(
    id_livro INT AUTO_INCREMENT,
    titulo_livro VARCHAR(150) NOT NULL,
    autor_livro VARCHAR(120) NOT NULL,
    isbn CHAR(13) NOT NULL UNIQUE,
    ano_publicacao INT,
    quantidade_disponivel INT NOT NULL CHECK (quantidade_disponivel >= 0),

    CONSTRAINT pk_livro PRIMARY KEY (id_livro)
);

-- 4. Tabela EMPRESTIMO

CREATE TABLE emprestimo(
    id_emprestimo INT AUTO_INCREMENT,
    data_emprestimo DATETIME DEFAULT CURRENT_TIMESTAMP,
    data_prevista DATE NOT NULL,
    data_devolucao DATE,
    status_emprestimo VARCHAR(20) DEFAULT 'aberto' CHECK(status_emprestimo = 'aberto' or status_emprestimo = 'devolvido' or status_emprestimo = 'atrasado'),
    id_usuario INT NOT NULL,
    id_livro INT NOT NULL,

    CONSTRAINT pk_emprestimo PRIMARY KEY (id_emprestimo),
    CONSTRAINT fk_usuario_emprestimo FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario),
    CONSTRAINT fk_livro_emprestimo FOREIGN KEY (id_livro) REFERENCES livro (id_livro)
);


-- Tabelas Adicionais

CREATE TABLE categoria(
    id_categoria INT AUTO_INCREMENT,
    nome_categoria VARCHAR(80) NOT NULL UNIQUE,

    CONSTRAINT pk_categoria PRIMARY KEY (id_categoria)
);

CREATE TABLE compra(
    id_compra INT AUTO_INCREMENT,
    data_compra DATETIME DEFAULT CURRENT_TIMESTAMP,
    valor_compra DECIMAL(10, 2) DEFAULT 0 NOT NULL,
    forma_pagamento ENUM('pix', 'debito', 'credito', 'dinheiro') DEFAULT 'dinheiro' NOT NULL,
    id_usuario INT NOT NULL,
    id_livro INT NOT NULL,

    CONSTRAINT pk_compra PRIMARY KEY (id_compra),
    CONSTRAINT fk_usuario_compra FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario),
    CONSTRAINT fk_livro_compra FOREIGN KEY (id_livro) REFERENCES livro (id_livro)
);

-- 5. ALTER TABLE

ALTER TABLE livro ADD editora VARCHAR(100);

-- -------------------------------------------------------------------
-- FASE 2 — DML: MANIPULAÇÃO DE DADOS

-- 6. INSERT de usuários

INSERT INTO usuario VALUES
(DEFAULT, 'Gabriel Travaglini Nogueira', 'gabriel@email.com', '19981214475', TRUE),
(DEFAULT, 'Francisco Miguel Magri', 'francisco@email.com', NULL, TRUE),
(DEFAULT, 'Luccas Manfredi', 'luccas@email.com', '19999999990', TRUE),
(DEFAULT, 'Franz Kramer', 'franz@email.com', '19999999991', TRUE);

-- 7. INSERT de livros

-- 1º O avesso da pele. Jeferson Tenório. Companhia das Letras.

-- 2º Garota, mulher, outras. Bernardine Evaristo. Companhia das Letras.

-- 3º Suíte Tóquio. Giovana Madalosso. Todavia.

-- 4º As sobras de ontem. Marcelo Vicintin. Companhia das Letras.

-- 5º A razão africana. Muryatan S. Barbosa. Todavia.

-- 6º Diário de um Banana. Jeff Kinney. VR

INSERT INTO livro VALUES
(DEFAULT, 'O avesso da pele', 'Jeferson Tenório', '9788535933390', 2020, 15, 'Companhia das Letras'),
(DEFAULT, 'Garota, mulher, outras.', 'Bernardine Evaristo', '9788535933819', 2020, 7, 'Companhia das Letras'),
(DEFAULT, 'Suíte Tóquio', 'Giovana Madalosso', '9786556920634', 2020, 2, 'Todavia'),
(DEFAULT, 'As sobras de ontem', 'Marcelo Vicintin', '9788535933352', 2020, 21, 'Companhia das Letras'),
(DEFAULT, 'A razão africana', 'Muryatan S. Barbosa', '9786556920580', 2020, 5, 'Todavia'),
(DEFAULT, 'Diário de um Banana', 'Jeff Kinney', '9788576831303', 2010, 37, 'VR');

-- 8. INSERT de empréstimos

INSERT INTO emprestimo VALUES
(DEFAULT, NOW(), '2026-11-15', NULL, 'aberto', 1, 6),
(DEFAULT, NOW(), '2026-11-25', NULL, 'aberto', 2, 5),
(DEFAULT, NOW(), '2026-11-20', NULL, 'aberto', 3, 4);

-- 9. UPDATE

SELECT id_usuario, telefone FROM usuario
WHERE telefone IS NULL;

UPDATE usuario
SET telefone = '1999999992'
WHERE telefone IS NULL;

-- 10. Atualização em lote

UPDATE livro
SET quantidade_disponivel = quantidade_disponivel + 2
WHERE ano_publicacao >= 2020;

-- 11. DELETE e integridade

INSERT INTO usuario VALUES (DEFAULT, 'Keynan Santos', 'keynan@email.com', '19999999993', FALSE);

SELECT * FROM usuario;
set @ultimo_usuario = LAST_INSERT_ID();

-- Deletando usuario novo criado 
DELETE FROM usuario
WHERE id_usuario = @ultimo_usuario;

-- Deletando usuario com emprestimo ja cadastrado
DELETE FROM usuario
WHERE id_usuario = 1;

-- Resposta:
-- O erro exibido foi:
-- Cannot delete or update a parent row: a foreign key constraint fails (biblioteca_som2_gabriel'. ` emprestimo', CONSTRAINT fk_usuario_emprestimo' FOREIGN KEY ( id_usuario` ) REFERENCES usuario (`id_usuario'))
-- Isso significa que não é possível excluir ou atualizar um usuario que possui um emprestimo, graças a uma restrição de chave estrangeira dada pelo constraint.

-- -------------------------------------------------------------------
-- FASE 3 — DQL: CONSULTAS E ANÁLISE

-- 12. SELECT básico

SELECT titulo_livro, autor_livro, quantidade_disponivel FROM livro;

-- 13. WHERE + ORDER BY

SELECT titulo_livro, quantidade_disponivel FROM livro
WHERE quantidade_disponivel > 2
ORDER BY quantidade_disponivel DESC; 

-- 14. LIKE

SELECT titulo_livro FROM livro
WHERE titulo_livro LIKE '%banana%';

-- 15. BETWEEN

SELECT titulo_livro, ano_publicacao FROM livro
WHERE ano_publicacao BETWEEN 2015 and 2025;

-- 16. Funções agregadas

-- COUNT = CONTAR UMA QUANTIDADE
-- SUM = SOMAR VALORES
-- AVG = CALCULAR MEDIA
-- MIN = MINIMO VALOR
-- MAX = MAXIMO VALOR

-- Quantidade de titulos disponiveis
SELECT COUNT(quantidade_disponivel) AS QUANTIDADE_LIVROS
FROM livro;

-- Quantidade total de livros disponiveis
SELECT SUM(quantidade_disponivel) as TOTAL_LIVROS
FROM livro;

-- Resumo de menor, maior e a media de livros em estoque
SELECT ROUND(MIN(quantidade_disponivel)) AS MENOR_ESTOQUE,
    ROUND(MAX(quantidade_disponivel)) AS MAIOR_ESTOQUE,
    ROUND(AVG(quantidade_disponivel)) AS MEDIA_ESTOQUE
FROM livro;

-- 17. INNER JOIN

SELECT e.id_emprestimo, u.nome_usuario AS usuario, l.titulo_livro AS livro, e.data_emprestimo, e.status_emprestimo
FROM emprestimo as e
INNER JOIN usuario as u
ON e.id_usuario = u.id_usuario
INNER JOIN livro as l
ON e.id_livro = l.id_livro
ORDER BY e.id_emprestimo;

-- 18. JOIN + WHERE

-- Vou adicionar um emprestimo com status 'devolvido' pois não tenho nenhum
INSERT INTO emprestimo VALUES (DEFAULT, NOW(), '2026-11-15', '2026-11-17', 'devolvido', 4, 3);

SELECT e.id_emprestimo, u.nome_usuario AS USUARIO, l.titulo_livro AS LIVRO, e.data_emprestimo, e.status_emprestimo
FROM emprestimo as e
INNER JOIN usuario as u
ON e.id_usuario = u.id_usuario
INNER JOIN livro as l
ON e.id_livro = l.id_livro
WHERE e.status_emprestimo = 'aberto'
ORDER BY e.id_emprestimo;

-- 19. GROUP BY

-- Vou adicionar mais um emprestimo a alguem que ja tenha
INSERT INTO emprestimo VALUES (DEFAULT, NOW(), '2026-11-15', NULL, 'aberto', 1, 2);


SELECT u.nome_usuario AS USUARIO, COUNT(e.id_emprestimo) AS QUANTIDADE_EMPRESTIMOS
FROM usuario AS u
INNER JOIN emprestimo AS e
ON e.id_usuario = u.id_usuario
GROUP BY u.id_usuario, u.nome_usuario
ORDER BY QUANTIDADE_EMPRESTIMOS DESC;

-- 20. LEFT JOIN

-- Vou adicionar mais um usuario porem que não possua emprestimos
INSERT INTO usuario VALUES (DEFAULT, 'Luana Lima', 'luana@email.com', '1999999994', TRUE);

SELECT u.nome_usuario, e.id_emprestimo, e.data_emprestimo
FROM usuario as u
LEFT JOIN emprestimo as e 
ON e.id_usuario =  u.id_usuario
ORDER BY u.nome_usuario;


-- -------------------------------------------------------------------
-- FASE 4 — TCL, TRANSAÇÕES E INTEGRIDADE

-- 21. Transação de empréstimo

START TRANSACTION;

SELECT id_livro, quantidade_disponivel FROM livro
WHERE id_livro = 1;

INSERT INTO emprestimo VALUES (DEFAULT, NOW(), '2026-11-15', NULL, 'aberto', 2, 1);

UPDATE livro
SET quantidade_disponivel = quantidade_disponivel - 1
WHERE id_livro = 1;


SELECT id_livro, quantidade_disponivel FROM livro
WHERE id_livro = 1;

COMMIT;

-- 22. ROLLBACK

START TRANSACTION;

UPDATE livro
SET quantidade_disponivel = 67
WHERE id_livro = 6;

SELECT id_livro, quantidade_disponivel FROM livro
WHERE id_livro = 6;

ROLLBACK;

-- 23. SAVEPOINT

START TRANSACTION;

UPDATE livro
SET quantidade_disponivel = 30
WHERE id_livro = 5;

SAVEPOINT reajuste_livro5;

UPDATE livro
SET quantidade_disponivel = 130
WHERE id_livro = 4;

ROLLBACK TO SAVEPOINT reajuste_livro5;

-- 24. Transação de devolução

START TRANSACTION;

SELECT id_emprestimo, id_livro, status_emprestimo FROM emprestimo
WHERE status_emprestimo = 'aberto'; 

UPDATE emprestimo
SET 
    status_emprestimo = 'devolvido',
    data_devolucao = NOW()
WHERE id_emprestimo = 1;

UPDATE livro
SET quantidade_disponivel = quantidade_disponivel + 1
WHERE id_livro = 6;

SELECT * FROM emprestimo;
SELECT quantidade_disponivel FROM livro WHERE id_livro = 6;

COMMIT;

-- Desafio Final de Integridade

-- 25. Análise técnica

-- Para cada situação abaixo, identifique o mecanismo mais adequado entre constraint, integridade referencial, transação ou regra da aplicação, e justifique tecnicamente sua escolha.

-- Cadastrar dois usuários com o mesmo e-mail.
-- Resposta: Regra de aplicação: UNIQUE

-- Cadastrar dois livros com o mesmo ISBN.
-- Resposta: Regra de aplicação: UNIQUE

-- Permitir quantidade disponível negativa.
-- Resposta: Regra de aplicação: CHECK

-- Criar empréstimo para usuário inexistente.
-- Resposta: Integridade referencial

-- Excluir livro com histórico de empréstimos.
-- Resposta: Constraint

-- Gravar empréstimo e falhar na redução do estoque.
-- Resposta: Transação

-- Emprestar livro cuja quantidade disponível seja zero.
-- Resposta: Regra de aplicação