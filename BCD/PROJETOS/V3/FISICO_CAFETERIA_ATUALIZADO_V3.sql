CREATE DATABASE IF NOT EXISTS SmartCoffee_Gabriel;

USE SmartCoffee_Gabriel;

CREATE TABLE Delivery (
endereco_entrega varchar(60) not null,
status_entrega boolean default true,
data_hora_saida datetime not null,
taxa_entrega decimal(6,2),
Id_entrega int AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE Fornecedor (
Nome_fornecedor varchar(60) not null,
Tipo_produto varchar(30) not null,
Marca varchar(30),
Valor_original decimal(5,2) not null,
Modo_entrega char(20),
Id_fornecedor int AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE Categoria (
Marca varchar(30) not null,
Quantidade_estoque  int not null,
Setor varchar(30) not null,
Nome_fornecedor varchar(60),
Tipo varchar(30),
Id_categoria int AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE Funcionarios (
nome_funcionario varchar(60) not null,
cpf varchar(14) not null unique,
data_adimissao datetime not null,
salario decimal(6,2) not null,
cargo varchar(20),
Id_funcionario int AUTO_INCREMENT PRIMARY KEY,
Id_pedido int,
Id_entrega int,
FOREIGN KEY(Id_entrega) REFERENCES Delivery (Id_entrega)
);

CREATE TABLE Produtos (
nome_produto varchar(30) not null,
descricao varchar(200),
preco_unitario decimal(6,2),
categoria varchar(60),
Id_produto int AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE Estoque (
unidade_medida varchar(30) ,
quantidade_atual int,
nome_insumo varchar(50),
quantidade_minima int,
Id_insumo int AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE Pagamento (
forma_pagamento enum("Pix", "Cartão", "Dinheiro"),
valor_pago decimal(6,2) not null,
data_hora_pagamento datetime,
status_pagamento int,
Id_pagamento int AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE Pedidos (
data_hora datetime not null,
tipo_pedido enum('Presencial', 'Delivery') default 'Presencial',
status_pedido boolean default true,
valor_total decimal(6,2) not null,
Id_pedido int AUTO_INCREMENT PRIMARY KEY,
Id_entrega int,
FOREIGN KEY (Id_entrega) REFERENCES Delivery (Id_entrega)
);


CREATE TABLE Clientes (
data_cadastro datetime not null,
cpf varchar(14) not null unique,
telefone varchar(15) not null,
email varchar(40) unique,
nome varchar(60) not null,
Id_cliente int AUTO_INCREMENT PRIMARY KEY,
Id_pedido int,
FOREIGN KEY(Id_pedido) REFERENCES Pedidos (Id_pedido)
);

CREATE TABLE Programa_de_fidelidade (
saldo_pontos int,
data_ultima_atualizacao datetime not null,
desconto_obtido decimal(6,2),
Id_fidelidade int AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE Item_produto (
Id_pedido int auto_increment primary key PRIMARY KEY,
Id_produto int,
Quantidade int,
preco_historico decimal(6,2),
FOREIGN KEY(Id_produto) REFERENCES Produtos (Id_produto)
);

CREATE TABLE Ficha_tecnica (
Id_produto int auto_increment primary key PRIMARY KEY,
Id_insumo int,
quantidade_gasta int,
FOREIGN KEY(Id_insumo) REFERENCES Estoque (Id_insumo)
);

ALTER TABLE Funcionarios ADD FOREIGN KEY(Id_pedido) REFERENCES Pedidos (Id_pedido);
