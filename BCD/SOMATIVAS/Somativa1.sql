CREATE DATABASE IF NOT EXISTS Oficina_Gabriel;

USE oficina_Gabriel;

CREATE TABLE if NOT exists Clientes(
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,

    nome_cliente VARCHAR(60) NOT NULL,
    cpf_cliente CHAR(14) NOT NULL UNIQUE,
    data_nascimento DATE NOT NULL,
    telefone_cliente CHAR(15),
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)

CREATE TABLE if NOT exists Veiculos(
    id_veiculo INT AUTO_INCREMENT PRIMARY KEY,

    placa_veiculo INT NOT NULL UNIQUE,
    marca_veiculo VARCHAR(30) NOT NULL,
    proprietario_veiculo VARCHAR(60) NOT NULL,
    tipo_servico ENUM("Manutenção", "Revisão", "Pintura") DEFAULT "Revisão" NOT NULL,
    localizacao_oficina VARCHAR(50)
)

CREATE TABLE if NOT exists Marcas(
    id_marca INT AUTO_INCREMENT PRIMARY KEY,

    fornecedor_marca VARCHAR(50) NOT NULL

)

CREATE TABLE if NOT exists Modelos(
    id_modelos INT AUTO_INCREMENT PRIMARY KEY


)

CREATE TABLE if NOT exists Funcionarios(
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,

    nome_funcionario VARCHAR(60) NOT NULL,
    cpf_funcionario CHAR(14) NOT NULL UNIQUE,
    data_nascimento DATE NOT NULL,
    salario DECIMAL(6,2),
    cargo VARCHAR(50)
)

CREATE TABLE if NOT exists Servicos(
    id_servico INT AUTO_INCREMENT PRIMARY KEY,

    duracao_servico INT,
    tipo_servico ENUM("Manutenção", "Revisão", "Pintura") DEFAULT "Revisão" NOT NULL,
    valor_servico DECIMAL(6,2)
)

CREATE TABLE if NOT exists Pecas(
    id_peca INT AUTO_INCREMENT PRIMARY KEY,

    modelo_peca VARCHAR(50) NOT NULL,
    quantidade_estoque INT,
    localizacao_oficina VARCHAR(50),
    fornecedor_peca VARCHAR(50),
    valor_unidade DECIMAL(5,2)
)


CREATE TABLE if NOT exists ordens_servicos(
    id_ordem INT AUTO_INCREMENT PRIMARY KEY,

    funcionario_emissor VARCHAR(60) NOT NULL,
    data_emissao_ordem TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    funcionario_desgnado VARCHAR(60) NOT NULL,
    prazo_termino DATE,
    classificacao_ordem ENUM("Risco", "Urgente", "Simples") DEFAULT "Simples"
)

CREATE TABLE if NOT exists Pagamentos(
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,

    valor_pagar DECIMAL(6,2),
    forma_pagamento ENUM("Débito", "Crédito", "Pix", "Dinheiro") DEFAULT "Débito",
    
)

CREATE TABLE if NOT exists Fornecedores(
    id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,

    nome_fornecedor VARCHAR(60) NOT NULL,
    peca_fornecida VARCHAR(50),
    valor_lote DECIMAL(6,2),
    endereco_fornecedor VARCHAR(50),
    ultimo_fornecimento TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)

