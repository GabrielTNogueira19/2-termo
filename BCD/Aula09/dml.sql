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

CREATE TABLE produto (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2),
    ativo BOOLEAN NOT NULL DEFAULT true,
    id_categoria INT NOT NULL,
    CONSTRAINT fk_produto_categoria FOREIGN KEY (id_categoria) REFERENCES categoria (id_categoria)
);

CREATE TABLE pedido (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    data_pedido DATETIME NOT NULL,
    status_pedido ENUM('ABERTO', 'PREPARANDO', 'FINALIZANDO', 'CANCELADO') NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    id_cliente INT NOT NULL,
    CONSTRAINT fk_pedido_cliente FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente)
);

CREATE TABLE item_pedido (
    id_item INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    observacao VARCHAR(150),
    CONSTRAINT fk_item_pedido FOREIGN KEY (id_pedido) REFERENCES pedido (id_pedido),
    CONSTRAINT fk_item_produto FOREIGN KEY (id_produto) REFERENCES produto (id_produto)
);

CREATE TABLE forma_pagamento (
    id_forma_pagamento INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(40) NOT NULL UNIQUE
);

CREATE TABLE pagamento (
    id_pagamento INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT NOT NULL,
    id_forma_pagamento INT NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    data_pagamento DATETIME,
    CONSTRAINT fk_pagamento_pedido FOREIGN KEY (id_pedido) REFERENCES pedido (id_pedido),
    CONSTRAINT fk_pagamento_forma_pagamento FOREIGN KEY (id_forma_pagamento) REFERENCES forma_pagamento (id_forma_pagamento)
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

INSERT INTO categoria (nome) VALUES 
('Café'),
('Bebidas Geladas'),
('Bebidas Quentes'),
('Salgados'),
('Sobremesas'),
('Combo');

INSERT INTO produto (nome, preco, ativo, id_categoria) VALUES
('Café Preto', 3.99, TRUE, 1),
('Smoothie', 15.99, TRUE, 2),
('Capuchino', 12.99, TRUE, 3),
('Coxinha', 7.99, TRUE, 4),
('Brigadeiro', 2.99, TRUE, 7);

INSERT INTO pedido (data_pedido, status_pedido, valor_total, id_cliente) VALUES
(NOW(), 'ABERTO', 19.98, 8),
(NOW(), 'PREPARANDO', 15.98, 1),
(NOW(), 'ABERTO', 20.98, 7),
(NOW(), 'CANCELADO', 5.98, 6),
(NOW(), 'FINALIZANDO', 17.98, 16);

INSERT INTO item_pedido (id_pedido, id_produto, quantidade, preco_unitario, observacao) VALUES
(11, 1, 1, 3.99, 'Descrição'),
(11, 2, 1, 15.99, 'Descrição'),
(12, 4, 2, 7.99, 'Descrição'),
(13, 3, 1, 12.99, 'Descrição'),
(13, 4, 1, 7.99, 'Descrição'),
(14, 5, 2, 2.99, 'Descrição'),
(15, 3, 1, 12.99, 'Descrição'),
(15, 1, 1, 3.99, 'Descrição');

INSERT INTO forma_pagamento (descricao) VALUES
('Pix'),
('Débito'),
('Crédito'),
('Dinheiro'),
('Cheque');

INSERT INTO pagamento (id_pedido, id_forma_pagamento, valor, data_pagamento) VALUES
(11, 1, 19.98, NOW()),
(12, 2, 15.98, NOW()),
(13, 3, 20.98, NOW()),
(14, 4, 5.98, NOW()),
(15, 5, 17.98, NOW());

-- Atribuir nomes aos IDS

INSERT INTO categoria (nome) VALUES ('Combos Extras');
SET @categorias_novas = (SELECT nome FROM categoria WHERE nome = 'Combos Extras' LIMIT 1);
SELECT @categorias_novas;

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
DELETE FROM pedido
WHERE id_cliente = 10;


-- Visualizar Banco de Ddados
SELECT * FROM produto;
-- WHERE id_cliente = 10;
SELECT * FROM categoria;

-- Procedimento de compra
-- Passo 1: realizar cadastro

INSERT INTO cliente (nome, email, telefone, cidade, ativo) VALUES
('Carlos Silva', 'Carlos.silva3@email.com', '1999999999', 'Santos', TRUE);
SET @cliente_compra = LAST_INSERT_ID();

-- Passo 2: realizar pedido

INSERT INTO pedido (data_pedido, status_pedido, valor_total, id_cliente) VALUES
(NOW(), 'ABERTO', 0.00, @cliente_compra);
SET @pedido_compra = LAST_INSERT_ID();

-- Passo 3: inserindo itens

INSERT INTO item_pedido (id_pedido, id_produto, quantidade, preco_unitario) VALUES
(@pedido_compra, 4, 1, 13.00), (@pedido_compra, 5, 1, 9.00);

-- Passo 4: atualizando total e status

UPDATE pedido
SET valor_total = 22.00,
    status_pedido = 'PREPARANDO'
WHERE id_pedido = @pedido_compra;

-- Passo 5:registrar pagamento

INSERT INTO pagamento (id_pedido, id_forma_pagamento, valor, data_pagamento) VALUES
(@pedido_compra, 2, 22, NOW());

-- Passo 6: consultar pedido e resultado

SELECT p.id_pedido,
    c.nome AS Nome_Cliente,
    p.status_pedido AS Status_Pedido,
    p.valor_total AS Compra_Total
FROM pedido p
JOIN cliente c ON c.id_cliente = p.id_cliente
WHERE p.id_pedido = @pedido_compra;

-- Transações: segurança para dml

START TRANSACTION;

UPDATE produto
SET preco = preco * 2.80
WHERE id_categoria = 1;

SELECT id_produto, nome, preco
FROM produto
WHERE id_categoria = 1;

-- Desfaz o que fizemos de errado ou volta uma transação

ROLLBACK;

-- Valida o procedimento de transação

COMMIT;



START TRANSACTION;
UPDATE cliente
SET cidade = "Santos"
WHERE id_cliente = 121;
SELECT * FROM cliente WHERE id_cliente = 121;
ROLLBACK;
COMMIT;