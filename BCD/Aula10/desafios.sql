-- ============================================================
-- AULA 08 - ATIVIDADE PRÁTICA DE DML
-- Nome: Gabriel Travaglini Nogueira
-- Turma: 2DEVIS Data: 02/10/2026
-- Base: smartcoffee_dml
-- ============================================================
USE smartcoffee_dml_gabriel;

-- IMPORTANTE:
-- Para toda questão de UPDATE ou DELETE, escreva primeiro um SELECT
-- com o mesmo WHERE para validar os registros afetados.

-- PARTE A - INSERT

-- 1. Cadastre dois novos clientes com dados diferentes.
INSERT INTO cliente (nome, email, telefone, cidade, ativo) VALUES
('Bruno Augusto', 'Bruno.augusto@email.com', '1999999987', 'Piracicaba', TRUE),
('Celso Ricardo', 'celso.ricardo@email.com', '1999999987', 'Limeira', TRUE);
SET @cliente_compra = LAST_INSERT_ID();

-- 2. Cadastre a categoria 'Especiais da Casa'.
INSERT INTO categoria (nome) VALUES ('Especiarias da Casa');
SET @categorias_novas = LAST_INSERT_ID();

-- 3. Localize o id da categoria criada e cadastre três produtos nela.
INSERT INTO produto (nome, preco, ativo, id_categoria) VALUES
('Bolo de Fubá', 25.00, TRUE, @categorias_novas),
('Bolo de Brigadeiro', 30.00, TRUE, @categorias_novas),
('Bolo de Morango', 40.00, TRUE, @categorias_novas);

-- 4. Cadastre um terceiro cliente sem telefone.
INSERT INTO cliente (nome, email, telefone, cidade, ativo) VALUES
('Roberta Nunes', 'Roberta.nunes@email.com', NULL, 'Piracicaba', TRUE);

-- 5. Crie um novo pedido para um dos clientes cadastrados.
INSERT INTO pedido (data_pedido, status_pedido, valor_total, id_cliente) VALUES
(NOW(), 'ABERTO', 0.00, 19);

-- 6. Use LAST_INSERT_ID() para guardar o id do pedido em @pedido_atividade
--    e insira pelo menos dois itens nesse pedido.
SET @ultimo_pedido = LAST_INSERT_ID();
INSERT INTO item_pedido (id_pedido, id_produto, quantidade, preco_unitario) VALUES
(@ultimo_pedido, 6, 1, 25.00),
(@ultimo_pedido, 7, 1, 30.00);
-- PARTE B - UPDATE

-- 7. Corrija o telefone de um dos clientes criados.

UPDATE cliente
SET telefone = '19981232158'
WHERE id_cliente = 20;

-- SELECT de validação: 
-- UPDATE:
-- SELECT final:

SELECT id_cliente, nome, telefone
FROM cliente
WHERE id_cliente = 20;

-- 8. Altere cidade e telefone de outro cliente em um único UPDATE.
UPDATE cliente
SET cidade = 'itatiba',
    telefone = '111111111'
WHERE id_cliente = 20;

-- 9. Aumente em 8% o preço dos produtos da categoria 'Especiais da Casa'.
UPDATE produto
SET preco = preco * 1.08
WHERE id_produto = 1;

-- 10. Altere o status do pedido criado para 'PREPARANDO'.
UPDATE pedido
SET status_pedido = 'PREPARANDO'
WHERE id_pedido = @ultimo_pedido;


-- 11. Atualize valor_total do pedido de acordo com os itens cadastrados.
--     Você pode calcular previamente com SELECT SUM(quantidade * preco_unitario).

UPDATE pedido
SET valor_total = 55.0
WHERE id_pedido = @ultimo_pedido;

-- 12. Escolha um dos produtos criados e faça uma exclusão lógica (ativo = FALSE).

UPDATE produto
SET ativo = FALSE
WHERE id_produto = 7;

-- PARTE C - DELETE

-- 13. Crie um cliente de teste sem pedidos.
--     Depois localize e exclua apenas esse cliente.
INSERT INTO cliente (nome, email, telefone, cidade, ativo) VALUES
('xina changai', 'china.xangai@email.com', '33333333333', 'china', TRUE);

set @ultimo_cliente = LAST_INSERT_ID();

DELETE FROM cliente
WHERE id_cliente = @ultimo_cliente;

SELECT * FROM cliente;


--14. Tente excluir um cliente da base original que possua pedidos.
--     Deixe o DELETE comentado após o teste e descreva o erro abaixo.

-- DELETE FROM cliente
-- WHERE id_cliente = 17;

-- Resultado observado:
-- Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`smartcoffee_dml_gabriel`.`pedido`, CONSTRAINT `fk_pedido_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`))


-- 15. Explique em comentário por que a FK bloqueou a exclusão.
-- Resposta:
-- A Chave Estrangeira bloqueou a exclusão para garantir a integridade do banco de dados. Como existem registros em outras tabelas vinculados ao `id_cliente = 17`, para proteger a consistência do sistema, é impedida a remoção 


-- 16. Crie uma categoria temporária chamada 'Excluir Depois' e remova-a.

INSERT INTO categoria (nome) VALUES
('Exluir depois');

set @ultimo_categoria = LAST_INSERT_ID();

DELETE FROM categoria
WHERE id_categoria = @ultimo_categoria;



-- PARTE D - INTEGRIDADE E ERROS CONTROLADOS
-- Execute uma tentativa por vez. Depois deixe o comando problemático comentado.

-- 17. Tente inserir um produto com id_categoria = 9999.
-- Qual restrição impediu a operação?

INSERT INTO produto (nome, preco, ativo, id_categoria) VALUES
("sopa", 99.99, FALSE, 9999);

-- R: O erro encontrado foi: Cannot add or update a child row: a foreign key constraint fails ('smartcoffee_dml_gabricl' .'produto' fk_produto_categoria' FOREIGN KEY ('id_categoria' ) REFERENCES " categoria' ("id_categoria')). Esse erro significa que está sendo tentado inserir um registro com um valor de id que não existe na tabela categoria

-- 18. Tente cadastrar um cliente usando 'ana@email.com'.
-- Qual restrição impediu a operação?

-- Primeiro cadastro:
INSERT INTO cliente (nome, email, telefone, cidade, ativo) VALUES
('ana', 'ana@email.com', NULL, 'Piracicaba', TRUE);

-- Segundo cadastro:
INSERT INTO cliente (nome, email, telefone, cidade, ativo) VALUES
('ana', 'ana@email.com', NULL, 'Piracicaba', TRUE);

-- R: Como o campo do email foi definido como UNIQUE o erro exibe uma mensagem de entrada duplicada e impede a inserção deste novo cliente

-- 19. Tente criar um pedido com id_cliente = 9999.
-- Qual restrição impediu a operação?

INSERT INTO pedido (data_pedido, status_pedido, valor_total, id_cliente) VALUES
(NOW(), 'ABERTO', 0.00, 9999);

-- R: R: O erro encontrado foi: Cannot add or update a child row: a foreign key constraint fails ('smartcoffee_dml_gabricl'.'pedido', 'fk_pedido_cliente' FOREIGN KEY ('id_cliente') REFERENCES 'cliente' ('id_cliente')). Esse erro significa que está sendo tentado inserir um registro com um valor de id que não existe na tabela cliente

-- 20. Escreva em comentários a diferença entre os três erros anteriores.

-- As três questões demonstram os três tipos de restrição cada uma protegendo um aspecto diferente dos dados:

-- Questão 17 (FK produto → categoria): Garante integridade referencial — impede que um produto aponte para uma categoria inexistente.
-- Questão 18 (UNIQUE email): Garante unicidade — impede que dois clientes compartilhem o mesmo e-mail, mesmo que os demais campos sejam idênticos.
-- Questão 19 (FK pedido → cliente): Também garante integridade referencial, mas em um par de tabelas diferente — impede que um pedido seja vinculado a um cliente inexistente.

-- PARTE E - DESAFIO COMPLETO COM TRANSAÇÃO

-- 21. Inicie uma transação.


-- 22. Dentro dela, cadastre um cliente, um pedido e dois itens relacionados.


-- 23. Faça uma consulta com JOIN comprovando que os registros existem
--     enquanto a transação está aberta.


-- 24. Execute ROLLBACK e depois use SELECT para provar que o cadastro foi desfeito.


-- 25. Repita o processo com novos dados e finalize usando COMMIT.
--     Depois consulte os registros persistidos.


-- DESAFIO EXTRA
-- 26. Escolha uma situação realista do SmartCoffee que exija INSERT + UPDATE
--     ou UPDATE + DELETE lógico. Descreva a regra de negócio e implemente.
