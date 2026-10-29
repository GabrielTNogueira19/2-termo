
-- Aula - Indexação e Normalização

DROP DATABASE IF EXISTS smartcoffee_index_gabriel;
CREATE DATABASE smartcoffee_index_gabriel;
USE smartcoffee_index_gabriel;

-- TABELA ERRADA 1

CREATE TABLE pedido_completo (
    id_pedido INT PRIMARY KEY,
    data_pedido DATETIME,
    cliente_nome VARCHAR(100),
    cliente_email VARCHAR(120),
    cliente_cidade VARCHAR(80),
    produto1 VARCHAR(100),
    produto2 VARCHAR(100),
    produto3 VARCHAR(108),
    categoria1 VARCHAR(80),
    categoria2 VARCHAR(80),
    categoria3 VARCHAR(80),
    quantidade1 INT,
    quantidade2 INT,
    quantidade3 INT
);

INSERT INTO pedido_completo VALUES (1, '2026-10-01 09:10:10', 'Gabriel Nogueira', 'gabriel@email.com', 'Limeira', 'Expresso', 'Brownie', NULL, 'Cafés', 'Doces', NULL, 2, 1, NULL);

-- Correções

-- Tabelas:
-- Cliente - Proddutos - Categoria - Pedido

CREATE TABLE cliente(
    id_cliente INT AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    cidade VARCHAR(80),
    CONSTRAINT pk_cliente PRIMARY KEY (id_cliente)
);

INSERT INTO cliente VALUES (DEFAULT, 'Gabriel Nogueira', 'gabriel@email.com', 'Limeira');

CREATE TABLE categoria(
    id_categoria INT AUTO_INCREMENT,
    nome VARCHAR(80) NOT NULL UNIQUE,
    CONSTRAINT pk_categoria PRIMARY KEY (id_categoria)
);

INSERT INTO categoria VALUES (DEFAULT, 'Cafés');

CREATE TABLE produto(
    id_produto INT AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL DEFAULT 0,
    id_categoria INT NOT NULL,
    CONSTRAINT pk_produto PRIMARY KEY (id_produto),
    CONSTRAINT fk_categoria_produto FOREIGN KEY (id_categoria) REFERENCES categoria (id_categoria)
);

INSERT INTO produto VALUES (DEFAULT, 'Café Preto', 5.99, 1);

CREATE TABLE pedido(
    id_pedido INT AUTO_INCREMENT,
    data_pedido DATETIME NOT NULL,
    id_cliente INT,
    CONSTRAINT fk_cliente_pedido FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente),
    CONSTRAINT pk_pedido PRIMARY KEY (id_pedido)
);

INSERT INTO pedido VALUES (DEFAULT, NOW(), 1);


CREATE TABLE item_pedido(
    id_item INT AUTO_INCREMENT,
    id_pedido INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL CHECK (quantidade > 0),
    preco_unitario DECIMAL(10,2) NOT NULL,
    CONSTRAINT pk_item_pedido PRIMARY KEY (id_item),
    CONSTRAINT fk_pedido_item FOREIGN KEY (id_pedido) REFERENCES pedido (id_pedido),
    CONSTRAINT fk_produto_item FOREIGN KEY (id_produto) REFERENCES produto (id_produto)
);

INSERT INTO item_pedido VALUES (DEFAULT, 1, 1, 2, 5.99);


SELECT * FROM cliente;
SELECT * FROM categoria;
SELECT * FROM produto;
SELECT * FROM pedido;
SELECT * FROM item_pedido;

-- --------------------------------------------
-- FORMAS DE CORRECÃO - 1FN

-- PRIMEIRA CORREÇÃO DA TABELA SERIA ELIMINAR GRUPOS REPETITIVOS COMO PRODUTO1, PRODUTO2, PRODUTO3
-- A FORMA 1FN FAZ SENTIDO AQUI POR QUE UM PEDIDO PODE POSSUIR QUALQUER QUANTIDADE DE ITENS SEM CRIAR NOVAS COLUNAS

-- --------------------------------------------
-- FORMAS DE CORRECÃO - 2FN

-- SEPARAR CLIENTE, PRODUTO E CATEGORIA
-- OS DADOS DE CLIENTE NÃO PERTENCEM AO PEDIDO. ELES DESCREVEM O CLIENTE. O NOME CATEGORIA TAMBÉM NÃO DEVE SER REPETIDO
-- CHAVE É COMPOSTA POR (ID_PEDIDO E ID_CLIENTE)
-- PEDIDO DEPENDE DE CLIENTE
-- A 2FN APARECE DE FORMA CONCRETA: EM UMA CHAVE COMPOSTA, ATRIBUTOS COMUNS DEPENDEM DA CHAVE INTEIRA

-- --------------------------------------------
-- FORMAS DE CORRECÃO - 3FN

-- VERSÃO INCORRETA DE PRODUTO
-- NOME_CATEGORIA DEPENDE DE ID_CATEGORIA. PORTANTO, ELE DEVE ESTAR EM CATEGORIA

-- --------------------------------------------
-- RESUMO

-- 1FN RESOLVE GRUPOS REPETITIVOS
-- 2FN RESOLVE DEPENDENCIAS PARCIAIS
-- 3FN REMOVE DEPENDENCIAS INDEVIDAS ENTRE ATRIBUTOS NÃO-CHAVE

-- REDUNDANCIA QUE DEVE PERMANECER
-- ITEM_PEDIDO.PRECO_UNITARIO DEVE GUARDAR O PREÇO PRATICO NO MOMENTO DA VENDA.

-- MESMO QUE PRODUTO, PRECO MUDE AMANHÃ, O HISTORICO DO PEDIDO PRECISA CONTINUST CORRETO

-- INDEXAÇÃO
-- ANALISAMOS O MODELO E CORRIGIMOS, AGORA IREMOS ANALISAR OS DADOS
-- EX 1 - CONSULTA POR NOME DA CATEGORIA

SELECT nome FROM categoria
WHERE nome = 'Cafés';
-- CRIAR INDEXAÇÃO PARA A COLUNA NOME

CREATE INDEX idx_categoria_nome ON produto (nome);

-- EX 2: PEDIDOS DE UM CLIENTE POR DATA
SELECT data_pedido FROM pedido
WHERE id_cliente = 1 AND data_pedido >= '2026-10-01'
ORDER BY data_pedido;

-- CRIAR INDEXAÇÃO PARA AS COLUNAS ID_CLIENTE E DATA_PEDIDO
CREATE INDEX idx_pedido_cliente_data ON pedido (id_cliente, data_pedido);

-- INDEX NÃO CORRIGE TABELA ERRADA
-- MODELO ERRADO + INDEX = MODELO ERRADO MAIS RÁPIDO

-- MODELO CORRETO + INDEX = ESTRUTURA CONSISTENTE E ACESSO EFICIENTE

SHOW INDEX FROM produto;

EXPLAIN SELECT * FROM pedido
WHERE id_cliente = 1 AND data_pedido >= '2026-10-01';


-- MUITOS INDICES OCUPAM ESPAÇO E PRECISAM SER ATUALISADOS EM INSERT

-- EXERCICIO - REVISÃO
-- TABELA ERRADA 2

CREATE TABLE fornecedor_produto(
    id_fornecedor INT,
    id_produto INT,
    nome_fornecedor VARCHAR(100),
    telefone_fornecedor VARCHAR(20),
    nome_produto VARCHAR(100),
    preco_atual_produto DECIMAL(10,2),
    preco_compra DECIMAL(10,2),
    prazo_entrega_dias INT,
    PRIMARY KEY (id_fornecedor, id_produto)
);

-- QUESTÕES TEÓRICAS DE REVISÃO:
-- EX 1: IDENTIFIQUE AS DEPENDENCIAS

-- Resposta: 2FN

-- EX 2: REESTRUTURE

CREATE TABLE fornecedor(
    id_fornecedor INT AUTO_INCREMENT,
    nome_fornecedor VARCHAR(100) NOT NULL,
    telefone_fornecedor VARCHAR(20),
    
    CONSTRAINT pk_fornecedor PRIMARY KEY (id_fornecedor)
);

CREATE TABLE item_fornecedor(
    id_item_fornecedor INT AUTO_INCREMENT,
    prazo_entrega_dias INT,
    preco_compra DECIMAL(10,2) DEFAULT 0,
    id_produto INT,
    id_fornecedor INT,
    CONSTRAINT pk_item_fornecedor PRIMARY KEY (id_item_fornecedor),
    CONSTRAINT fk_item_fornecedor_fornecedor FOREIGN KEY (id_fornecedor) REFERENCES fornecedor(id_fornecedor),
    CONSTRAINT fk_item_fornecedor_produto FOREIGN KEY (id_produto) REFERENCES produto (id_produto)
);


-- EX 3: CRIE INDICES PARA PRODUTOS E FORNECEDORES E PEDIDOS

-- Resposta:

-- INDEX PARA TABELA E CAMPO DO PRODUTO
CREATE INDEX idx_produtos_nome ON produto (nome);

-- INDEX PARA TABELA E CAMPO FORNECEDOR
CREATE INDEX idx_fornecedor_id_nome ON fornecedor (id_fornecedor, nome_fornecedor);

-- INDEX PARA TABELA E CAMPO PEDIDOS
CREATE INDEX idx_pedido_data_pedido ON pedido (data_pedido);

-- EX 4: LISTE INDICES EXISTENTES EM PRODUTOS E FORNECEDORES

SHOW INDEX FROM pedido;

SHOW INDEX FROM fornecedor;

-- EX 5: EXECUTE O EXPLAIN ANTES E DEPOIS

EXPLAIN SELECT * FROM pedido
WHERE id_pedido = 1;

-- EX 6: EXPLIQUE O POR QUE NAO DEVEMOS INDEXAR TODAS AS COLUNAS

-- RESPOSTA: 

-- IMPORTANTE LEMBRAR DE INDEXAR SOMENTE AS TABELAS OU COLUNAS QUE IREMOS UTILIZAR PARA QUE NÃO SOFRA UMA SOBRECARGA DE INFORMAÇÕES DESNECESSÁRIAS E DEIXE NO BD PESADO.