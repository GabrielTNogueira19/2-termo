-- ============================================================
-- AULA 09 - ATIVIDADE PRÁTICA DE DQL
-- Nome: Gabriel Travaglini Nogueira
-- Turma: 1DEVIS Data: 09/10/2026
-- Base: smartcoffee_dql
-- ============================================================
USE smartcoffee_dml_GABRIEL;

-- PARTE A - AQUECIMENTO

-- 1. Liste todos os clientes cadastrados.

SELECT * FROM cliente;


-- 2. Exiba apenas nome, cidade e e-mail dos clientes.

SELECT nome, cidade, email FROM cliente;


-- 3. Liste os nomes das cidades sem repetir valores.

SELECT DISTINCT cidade
FROM cliente;

-- 4. Liste todos os produtos em ordem crescente de preço.

SELECT nome, preco
FROM produto
ORDER BY preco ASC;

-- 5. Mostre apenas os 5 produtos mais caros.

SELECT nome, preco FROM produto
ORDER BY preco DESC LIMIT 5 OFFSET 0;

-- PARTE B - FILTROS

-- 6. Liste os produtos com preço entre R$ 8,00 e R$ 15,00.

SELECT nome, preco FROM produto
WHERE preco BETWEEN 8.00 AND 15.00;

-- 7. Liste os clientes das cidades Limeira ou Americana.

SELECT nome, cidade FROM cliente
-- WHERE cidade = 'limeira' or cidade = 'americana';
WHERE cidade IN ('limeira', 'americana');


-- 8. Localize os produtos cujo nome contém a palavra “Café”.

SELECT nome
FROM produto
WHERE nome LIKE '%cafe%';

-- 9. Liste os clientes que não informaram telefone.

SELECT nome, telefone
FROM cliente
WHERE telefone IS NULL;

-- 10. Mostre os pedidos FINALIZADOS com valor acima de R$ 20,00, do maior para o menor valor.

SELECT id_pedido, data_pedido, valor_total, status_pedido
FROM pedido
WHERE status_pedido = 'finalizando' AND valor_total > 20.00
ORDER BY valor_total DESC;

-- PARTE C - CÁLCULOS E AGRUPAMENTOS

-- 11. Informe quantos produtos estão cadastrados.

SELECT COUNT(*) AS QNTD_PRODUTOS 
FROM produto;

-- 12. Mostre menor preço, maior preço e preço médio dos produtos.

SELECT ROUND(MIN(preco), 2) AS MIN_PRECO,
    ROUND(MAX(preco), 2) AS MAX_PRECO,
    ROUND(AVG(preco),2) AS MEDIA_PRECO
FROM produto;

-- 13. Informe quantos clientes existem em cada cidade.

SELECT cidade, COUNT(*) AS QTDE_CLIENTES
FROM cliente
GROUP BY cidade;

-- 14. Mostre somente as cidades que possuem dois ou mais clientes.

SELECT cidade, COUNT(*) AS QTDE_CLIENTES
FROM cliente
GROUP BY cidade
HAVING COUNT(*) >= 2;

-- 15. Calcule o faturamento total considerando apenas pedidos FINALIZADOS.

SELECT SUM(valor_total) as FATURAMENTO
FROM pedido
WHERE status_pedido = 'finalizando';

-- PARTE D - RELACIONAMENTOS

-- 16. Liste cada pedido exibindo id, data, nome do cliente, status e valor total.

SELECT pedido.id_pedido, pedido.data_pedido, cliente.nome as cliente, pedido.valor_total
FROM pedido AS pedido
INNER JOIN cliente as cliente
ON cliente.id_cliente = pedido.id_cliente;

-- 17. Liste cada produto acompanhado do nome de sua categoria.

SELECT produto.id_produto, produto.nome, categoria.nome AS nomeCategoria
FROM produto as produto
INNER JOIN categoria as categoria
ON categoria.id_categoria = produto.id_categoria;

-- 18. Gere um relatório dos itens vendidos: pedido, produto, quantidade,
--     preço unitário e subtotal.

SELECT pedido.id_pedido, pedido.status_pedido, cliente.nome, produto.nome ,item_pedido.quantidade, item_pedido.quantidade * item_pedido.preco_unitario as Subtotal
FROM pedido as pedido
INNER JOIN cliente as cliente
ON cliente.id_cliente = pedido.id_cliente
INNER JOIN item_pedido as item_pedido
ON item_pedido.id_pedido = pedido.id_pedido
INNER JOIN produto as produto
ON produto.id_produto = item_pedido.id_produto
ORDER BY pedido.id_pedido, produto.nome;

-- 19. Mostre todos os clientes, inclusive aqueles que nunca fizeram pedidos.

SELECT cliente.id_cliente, cliente.nome, pedido.id_pedido, pedido.data_pedido
FROM cliente
LEFT JOIN pedido
ON pedido.id_cliente = cliente.id_cliente
ORDER BY cliente.nome;

-- 20. Liste apenas os clientes que nunca fizeram pedidos.

SELECT cliente.id_cliente, cliente.nome, pedido.id_pedido
FROM cliente
LEFT JOIN pedido
ON pedido.id_cliente = cliente.id_cliente
WHERE pedido.id_pedido IS NULL;

-- PARTE E - DESAFIO GERENCIAL

-- 21. Informe quantos pedidos FINALIZADOS cada cliente realizou e quanto
--     cada cliente gastou. Ordene do maior gasto para o menor.


-- 22. Mostre a quantidade de produtos e o preço médio de cada categoria.


-- 23. Descubra quais produtos possuem preço superior ao preço médio geral.


-- 24. Classifique os produtos como Econômico, Intermediário ou Premium.
--     Defina e informe suas faixas de preço.


-- 25. CONSULTA AUTORAL
-- Pergunta de negócio:
--
-- Por que essa informação é útil?
--
-- Consulta: