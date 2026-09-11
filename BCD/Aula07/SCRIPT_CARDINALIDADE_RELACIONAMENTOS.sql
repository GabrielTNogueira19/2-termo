-- Active: 1788519225521@@127.0.0.1@3306@sesi_cr_ta
-- Sql ANSI 2003 - brModelo.
-- Relacionamentos de cardinalidade - Banco de dados exemplo:

create DATABASE if NOT EXISTS SESI_CR_TA;

use SESI_CR_TA;

CREATE TABLE Cliente (
ID_cliente int Auto_increment PRIMARY KEY,
Nome_cliente varchar(60)
)

CREATE TABLE Pedido (
ID_pedido int Auto_increment PRIMARY KEY,
Data_pedido datetime not null,
ID_cliente int NOT NULL,
FOREIGN KEY(ID_cliente) REFERENCES Cliente (ID_cliente)
);

CREATE TABLE Estoque (
ID_produto INT NOT NULL UNIQUE,
Nome_produto VARCHAR(60),
ID_estoque int Auto_increment PRIMARY KEY,
Quantidade INT
-- PRIMARY KEY(ID_produto,ID_estoque)
)

CREATE TABLE Fornecedor (
ID_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
Razao_social VARCHAR(60)
)

CREATE TABLE Produto (
ID_produto INT AUTO_INCREMENT PRIMARY KEY,
Nome_produto VARCHAR(60)
)

CREATE TABLE Item_produto (
ID_produto INT NOT NULL,
ID_fornecedor INT NOT NULL,
ID_item INT AUTO_INCREMENT PRIMARY KEY,
Valor DECIMAL(7,2),
Observacao TEXT(300),
FOREIGN KEY(ID_produto) REFERENCES Produto (ID_produto),
FOREIGN KEY(ID_fornecedor) REFERENCES Fornecedor (ID_fornecedor)
)

-- DESAFIOS:

-- ### Questão 1 - Uma categoria pode possuir vários produtos. Cada produto pertence a apenas uma categoria:
-- RESPOSTA: Categoria(1,n) -- Possui -- (1,1)Produto

-- ### Questão 2 - Um funcionário pode registrar vários pedidos. Cada pedido é registrado por um funcionário:
-- RESPOSTA: Funcionario(1,n) -- Registra -- (1,1)Pedido

-- ### Questão 3 - Um fornecedor comercializa vários produtos, e o mesmo produto pode ser comprado de vários fornecedores:
-- RESPOSTA: Fornecedor(1,n) -- Comercializa -- (1,n)Produto

-- ### Questão 4 - Uma mesa pode existir sem nenhuma reserva futura. Uma reserva deve estar vinculada a uma mesa:
-- RESPOSTA: Cliente(0,n) -- Reserva -- (1,1)Reserva

-- ### Questão 5 - Um pedido possui vários itens. Um item de pedido pertence a um único pedido.
-- RESPOSTA: Pedido(1,n) -- Possui -- (1,1)item
