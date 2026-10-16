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

-- --------------------------------------------------------------
-- EX16 - HAVING - CRIAR CONDICOES POR CATEGORIA
-- WHERE FILTRA LINHAS ANTES DO AGRUPAMENTO
-- HAVING FILTRA LINHAS DEPOIS DO GROUP BY

SELECT cidade, COUNT(*) AS QTDE_CLIENTES
FROM cliente
GROUP BY cidade
HAVING COUNT(*) <= 10;

-- --------------------------------------------------------------
-- EX17 - RESUMO DE UMA CONSULTA COMPLETA

-- SELECT colunas
-- FROM tabela
-- WHERE condicao
-- GROUP BY coluna_agrupar
-- HAVING condicao_agrupar
-- ORDER BY colunas
-- LIMIT quantidade

-- --------------------------------------------------------------
-- --------------------------------------------------------------
-- PARTE II - RELACOES ENTRE ENTIDADES
-- JOINS - CONSULTA DE ENTIDADES RELACIONADAS
-- INNER JOIN - RETORNA REGISTROS QUE POSSUEM CORRESPONDENCIA ENTRE DUAS TABELAS

-- --------------------------------------------------------------
-- EX01 - PEDIDOS COM O NOME DO CLIENTE

SELECT p.id_pedido, p.data_pedido, c.nome as Cliente, p.Valor_total
FROM pedido as p
INNER JOIN cliente as c
ON c.id_cliente = p.id_cliente;

-- OBS: RELACIONE O CLIENTE CUJO ID_CLIENTE É IGUAL AO ID_CLIENTE FEITO NO PEDIDO
-- APELIDOS COMO REFERENCIAS OU ALIAS - P E C SAO ALISASES QUE DEIXAM A CONSULTA COM VARIAS TABELAS MAIS CURTA E LEGIVEIS

-- --------------------------------------------------------------
-- EX02.1 - TODOS OS CLIENTES, INCLUSIVE QUEM NUNCA COMPROU
-- LEFT JOIN - MANTEM TODOS OS REGISTROS DA ESQUERDA, MESMO SEM CORRESPONDENCIA NA DIREITA

SELECT c.nome, p.id_pedido, p.data_pedido
FROM cliente as c
LEFT JOIN pedido as p 
ON p.id_cliente =  c.id_cliente
ORDER BY c.nome;

-- EX02.2 - CLIENTES SEM PEDIDOS
SELECT c.id_cliente, c.nome
FROM cliente AS c
LEFT JOIN pedido AS p
ON p.id_cliente = c.id_cliente
WHERE p.id_pedido IS NULL;

-- EX03.1 - ITENS DE PEDIDO COM NOME DE PRODUTO
-- JOIN COM TRES TABELAS

SELECT p.id_pedido, pr.nome as produto, ip.quantidade, ip.preco_unitario, ip.quantidade * ip.preco_unitario as Subtotal
FROM pedido AS p
INNER JOIN item_pedido AS ip
ON ip.id_pedido = p.id_pedido
INNER JOIN produto AS pr
ON pr.id_produto = ip.id_produto
ORDER BY p.id_pedido;

-- EX3.2 - PRODUTO E NOME DE SUA CATEGORIA

SELECT pr.nome as produto, ca.nome as categoria, pr.preco
FROM produto as pr
INNER JOIN categoria as ca
ON ca.id_categoria = pr.id_categoria
ORDER BY ca.nome, pr.nome;

-- EX04.1 - QUANTIDADE DE PRODUTOS POR CATEGORIA
-- AGREGACAO E JOIN

SELECT ca.nome as categoria, COUNT(pr.id_produto) as qntd_produtos
FROM categoria AS ca
LEFT JOIN produto as pr
ON pr.id_categoria = ca.id_categoria
GROUP BY ca.id_categoria, ca.nome
ORDER BY qntd_produtos DESC;

-- EX04.2 - TOTAL DE COMPRAS POR CLIENTE

SELECT c.nome as cliente, COUNT(p.id_pedido) as qntd_pedidos, SUM(p.valor_total) as total_comprado
FROM cliente AS c
INNER JOIN pedido AS p
ON p.id_cliente = c.id_cliente
WHERE p.status_pedido = "aberto"
GROUP BY c.id_cliente, c.nome
ORDER BY total_comprado DESC;

-- EX05 - VARIAS ENTIDADES OU TABELAS EM UMA CONSULTA DE RELATORIO
-- RELATORIO COMPLETO DO PEDIDO

SELECT p.id_pedido, DATE_FORMAT(p.data_pedido, '%d %m %y %h:%i') as DATA, c.nome as cliente, pr.nome as produto, ip.quantidade, ip.preco_unitario, ip.quantidade * ip.preco_unitario as SUBTOTAL
FROM pedido as p
INNER JOIN cliente as c
ON c.id_cliente = p.id_cliente
INNER JOIN item_pedido as ip
ON ip.id_pedido = p.id_pedido
INNER JOIN produto as pr
ON pr.id_produto = ip.id_produto
ORDER BY p.id_pedido, pr.nome;

-- DATE_FORMAT - (P.DATA_PEDIDO, '%d %m %y %h:%i') - PADRAO DE FORMATACAO BRASILEIRO
-- D = DIA
-- M = MES
-- Y = ANO
-- H = HORA
-- I = MINUTOS

-- EX06 - CASE - PERMITE CRIAR CLASSIFICACOES BASEADAS EM REGRAS
-- CASE - CRIAR CLASSIFICACOES EM RESULTADOS

SELECT nome, preco,
CASE 
    WHEN preco < 8.00 THEN 'Economico'  
    WHEN preco <= 15.00 THEN 'Intermediario'  
    ELSE  'Premium'
END AS faixa_precos
FROM produto
ORDER BY preco;

-- EX07 - SUBCONSULTA - É UMA CONSULTA DENTRO DE UMA OUTRA CONSULTA
-- PRODUTOS ACIMA DO PRECO MEDIO

SELECT nome, preco
FROM produto
WHERE preco > (SELECT avg(preco) FROM produto)
ORDER BY preco desc;
