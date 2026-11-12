-- Active: 1794484718469@@127.0.0.1@3306@mysql
-- A escola Biblioteca Conecta deseja substituir planilhas e registros manuais por um
-- banco de dados relacional capaz de controlar usuarios, livros e empréstimos. Sua
-- missão é desenvolver a primeira versão do banco, desde sua criação ate operacoes de consulta, manipulacao e controle transacional. A atividade ja inicia com 3 tabelas e voce devera criar e adaptar mais 2 tabelas.

-- Criar tabelas - Usuario, Livro, Emprestimo
DROP DATABASE biblioteca_senai_gabriel;
-- Fase 1
CREATE DATABASE IF NOT EXISTS biblioteca_senai_gabriel;
USE biblioteca_senai_gabriel;

-- fase 2
-- CRIAÇÃO DE TABELAS

CREATE TABLE usuario(
    id_usuario INT AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    ativo BOOLEAN DEFAULT TRUE,

    CONSTRAINT pk_usuario PRIMARY KEY (id_usuario),
    CONSTRAINT uq_email UNIQUE (email)
);

CREATE TABLE categoria(
    id_categoria INT AUTO_INCREMENT,
    nome_categoria VARCHAR(80) NOT NULL UNIQUE,

    CONSTRAINT pk_categoria PRIMARY KEY (id_categoria)
);

CREATE TABLE livro(
    id_livro INT AUTO_INCREMENT,
    titulo VARCHAR(150) NOT NULL,
    autor VARCHAR(120) NOT NULL,
    isbn CHAR(13) NOT NULL UNIQUE,
    ano_publicacao INT,
    quantidade_disponivel INT DEFAULT 0 CHECK (quantidade_disponivel >= 0),

    id_categoria INT NOT NULL,
    CONSTRAINT pk_livro PRIMARY KEY (id_livro),
    CONSTRAINT uq_isbn UNIQUE (isbn),
    CONSTRAINT fk_livro_categoria FOREIGN KEY (id_categoria) REFERENCES categoria (id_categoria)
);

CREATE TABLE IF NOT EXISTS emprestimo(
    id_emprestimo INT AUTO_INCREMENT,
    data_emprestimo DATETIME DEFAULT CURRENT_TIMESTAMP,
    data_prevista DATE NOT NULL,
    data_devolucao DATE,
    status_emprestimo VARCHAR(20) DEFAULT 'ABERTO' CHECK (status_emprestimo IN ('ABERTO', 'DEVOLVIDO', 'ATRASADO')),

    id_usuario INT NOT NULL,
    id_livro INT NOT NULL,

    CONSTRAINT pk_emprestimo PRIMARY KEY (id_emprestimo),
    CONSTRAINT fk_usuario FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario) on delete RESTRICT,
    CONSTRAINT fk_livro FOREIGN KEY (id_livro) REFERENCES livro (id_livro) on delete RESTRICT
);

CREATE TABLE IF NOT EXISTS fornecedor(
    id_fornecedor INT AUTO_INCREMENT,
    cnpj VARCHAR(20) NOT NULL UNIQUE,
    razao_social VARCHAR(80) NOT NULL,

    CONSTRAINT pk_fornecedor PRIMARY KEY (id_fornecedor),
    CONSTRAINT uq_cnpj UNIQUE (cnpj)
);


ALTER TABLE livro ADD editora VARCHAR(100);


INSERT INTO USUARIO (NOME, EMAIL, TELEFONE, ATIVO) VALUES
('BRUNO','BRUNO@EMAIL.COM', '19988123148',TRUE),
('ANA CLARA', 'ANACLARA@EMAIL.COM','13145789784',TRUE),
('ANA CHICO', 'ANACHICO@EMAIL.COM',NULL, TRUE);

-- 7.
INSERT INTO CATEGORIA (nome_categoria) VALUES ('FICÇÃO'), ('TERROR'),
('FANTASIA'), ('ROMANCE');

SELECT * FROM CATEGORIA;

INSERT INTO LIVRO VALUES ('HARRY POTTER','J K ROWLING', '1231456454', 1997, 30,1);

INSERT INTO EMPRESTIMO VALUES (NOW(), '2026-12-11',NULL,'ABERTO',1,1);


SELECT TITULO, AUTOR, QUANTIDADE_DISPONIVEL FROM LIVRO;

-- 13.
SELECT * FROM LIVRO
WHERE QUANTIDADE_DISPONIVEL > 2
ORDER BY QUANTIDADE_DISPONIVEL DESC;

-- 14.
SELECT TITULO FROM LIVRO
WHERE TITULO LIKE '%HARRY%';