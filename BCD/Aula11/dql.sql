-- AULA 11 - DQL (DATA QUERY LANGUAGE) - LINGUAGEM DE COSULTA DE DADOS

-- --------------------------------------------------------------
-- EX01 - SELECT SIMPLES

SELECT coluna
FROM tabela;

-- CONSULTA TODAS AS COLUNAS DA TABELA
SELECT * FROM cliente;

-- CONSULTA DADOS COM VARIAS COLUNAS
SELECT nome, telefone FROM cliente;
SELECT nome, ativo FROM produto;

-- --------------------------------------------------------------
-- EX02 - CONSULTANDO E PERSONALIZANDO A CONSULTA
SELECT nome AS Nome_Cliente, telefone AS Contato_Cliente 
FROM cliente;

SELECT nome, preco, preco * 1.01 AS Preco_Ajustado
FROM produto;

-- --------------------------------------------------------------
-- EX03 - DISTINCT - ELIMINAR REPETICOES

-- COM DISTINCT CADA RESULTADO REPETIDO É APRESENTADO APENAS UMA VEZ
SELECT DISTINCT cidade
FROM cliente;

-- SEM DISTINCT CADA RESULTADO É APRESENTADO VARIAS VEZES
SELECT cidade
FROM cliente;

-- --------------------------------------------------------------
-- EX04 - USO DE WHERE - FILTRO DE REGISTROS

-- = IGUAL
-- <> OU != DIFERENTE
-- > MAIOR QUE
-- >= MAIOR IGUAL
-- < MENOR QUE
-- <= MENOR IGUAL

-- CONSULTAR PRECOS QUE POSSUEM VALOR ACIMA DE 15.00 REAIS
SELECT nome, preco
FROM produto
WHERE preco < 15.00;

-- CONSUTAR PRODUTOS ATIVOS OU INATIVOS
SELECT nome, preco
FROM produto
WHERE ativo = TRUE;

-- CONSULTAR VALOR TOTAL DE PEDIDOS MAIORES OU IGUAIS A 25.00 REAIS
SELECT id_pedido, data_pedido, valor_total
FROM pedido
WHERE valor_total >= 25.00;

-- --------------------------------------------------------------
-- EX05 - USO DE AND, OR E NOT

-- AND - TODAS AS CONDICOES VERDADEIRAS
SELECT nome, preco
FROM produto
WHERE preco >= 8.00 AND preco <= 25.00;

-- OR - UMA DAS CONDICOES PRECISA SER VERDADEIRA
SELECT nome, cidade
FROM cliente
WHERE cidade = "limeira" or cidade = "campinas";

-- NOT - CRIAR UMA CONDICAO DE NEGACAO
SELECT nome, cidade
FROM cliente
WHERE NOT cidade = "limeira";

-- AND E OR JUNTOS - PRECISAMOS INSERIR ()
SELECT nome, cidade, ativo
FROM cliente
WHERE ativo = TRUE AND (cidade = "limeira" OR cidade = "piracicaba");

-- --------------------------------------------------------------
-- EX06 - BETWEEN - PESQUISAR POR INTERVALOS
-- LIMITE INICIAL E FINAL

-- CONSULTAR POR INTERVALO DE VALORES
SELECT nome, preco
FROM produto
where preco BETWEEN 8.00 AND 15.00;

-- CONSULTAR DADOS POR INTERVALO DE DATAS
SELECT id_pedido, data_pedido, valor_total
FROM pedido
where data_pedido BETWEEN '2026-10-01 00:00:00' and '2026-10-30 23:59:59';

-- EX07 - IN - MUITAS POSSIBILIDADES

SELECT nome, cidade
FROM cliente
WHERE cidade in ("limeira", "americana", "piracicaba");

SELECT nome, cidade
FROM cliente
WHERE cidade NOT IN ("limeira", "piracicaba");

-- --------------------------------------------------------------
-- EX08 - LIKE - PESQUSIA POR TEXTOS
-- CORINGAS
-- % VARIOS CARACTERES
-- _ APENAS UM CARACTERE

-- % NO FIM = TODAS AS PALAVRAS COM CAFE NO COMECO
-- CONSULTA PELA PALAVRA QUE DESEJA E QUAL COMECA
SELECT nome
FROM produto
WHERE nome LIKE 'cafe%';

-- CONSULTA PELA PALAVRA QUE CONTEM CHOCOLATE
SELECT nome
FROM produto
WHERE nome LIKE '%chocolate%';

-- % NO COMECO = TODAS AS PALAVRAS COM CAFE NO FIM
-- CONSULTA PELA PALAVRA QUE DESEJA E QUAL TERMINA
SELECT nome
FROM cliente
WHERE nome LIKE '%silva';

SELECT nome
FROM produto
WHERE nome LIKE '%_rig%';

-- --------------------------------------------------------------
-- EX09 - NULL - AUSENCIA DE VALOR

SELECT nome, telefone
FROM cliente
WHERE telefone IS NULL;

SELECT nome, telefone
FROM cliente
WHERE telefone IS NOT NULL;

-- --------------------------------------------------------------
-- EX10 - ORDER BY - ORDENAR RESULTADOS
-- ASC É CRESCENTE
-- DESC É DECRESCENTE

SELECT nome, preco
FROM produto
ORDER BY preco ASC;

SELECT nome, preco
FROM produto
ORDER BY preco DESC;

SELECT nome, preco
FROM produto
ORDER BY nome ASC, preco DESC;

-- --------------------------------------------------------------
-- ORDENAR POR MAIS DE UMA COLUNA
SELECT cidade, nome
FROM cliente 
ORDER BY cidade ASC, nome DESC;

-- --------------------------------------------------------------
-- EX11 - LIMIT - DETERMINAR UMA QUANTIDADE DE LINHAS

SELECT nome, preco FROM produto
ORDER BY preco DESC LIMIT 5;

SELECT nome, preco FROM produto
ORDER BY nome LIMIT 5 OFFSET 5;

-- --------------------------------------------------------------
-- EX12 - CALCULOS EM COLUNAS

SELECT nome, preco, preco * 1.3 AS Preco_Reajuste
FROM produto;

SELECT id_item, quantidade, preco_unitario, quantidade * preco_unitario AS Subtotal
FROM item_pedido;

-- --------------------------------------------------------------
-- EX13 - FUNCOES

SELECT UPPER(nome) AS NOME_M, LOWER(cidade) AS cidade_m
FROM cliente;

SELECT CONCAT(nome, ' -- ', cidade) AS cliente_cidades
FROM cliente;

-- NUMEROS
SELECT nome, preco, ROUND(preco*2,2) AS preco_desconto
FROM produto;

-- DATAS
SELECT id_pedido, data_pedido, valor_total, 
DATE(data_pedido) AS DATAS, 
MONTH(data_pedido) AS MES, 
YEAR(data_pedido) AS ANO,
DAY(data_pedido) AS DIAS,
TIME(data_pedido) AS HORARIO
FROM pedido;

-- SUBSTITUIR O NULL NO RESULTADO COM COALESCE
SELECT nome, COALESCE(telefone, 'Não Informado') AS Telefone
FROM cliente;

-- --------------------------------------------------------------
-- EX14 - FUNCOES DE AGREGACAO
-- COUNT = CONTAR UMA QUANTIDADE
-- SUM = SOMAR VALORES
-- AVG = CALCULAR MEDIA
-- MIN = MINIMO VALOR
-- MAX = MAXIMO VALOR

-- QUANTOS CLIENTES EXISTEM NA TABELA
SELECT COUNT(*) AS TOTAL_CLIENTE
FROM cliente;

-- PRECO MEDIO DOS PRODUTOS (COM ARREDONTAMENTO)
SELECT ROUND(AVG(preco), 2) AS Preco_medio_produtos
FROM produto;

-- RESUMO DE PRECOS
SELECT ROUND(MIN(preco),2) AS Precos_Baixos,
    ROUND(MAX(preco),2) AS Precos_Altos,
    ROUND(AVG(preco),2) AS Precos_Media
FROM produto;

-- TOTAL DE PEDIDOS COM CRITERIO
SELECT SUM(valor_total) as FATURAMENTO
FROM pedido
WHERE status_pedido = 'preparando';

-- --------------------------------------------------------------
-- EX15 - GROUP BY - AGRUPAR DADOS

-- QUANTOS CLIENTES TENHO EM CADA CIDADE
SELECT cidade, COUNT(*) AS QTDE_CLIENTES
FROM cliente
GROUP BY cidade;

-- QUANTIDADE DE PRODUTOS POR CATEGORIA
SELECT id_categoria, COUNT(*) AS QTDE_PRODUTOS
FROM produto
GROUP BY id_categoria;