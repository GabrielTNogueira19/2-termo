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
    quantidade_disponivel INT NOT NULL CHECK (quantidade_disponivel > 0),

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

-- -- 17. INNER JOIN

-- SELECT e.
