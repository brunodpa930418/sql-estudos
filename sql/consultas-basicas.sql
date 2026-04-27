-- =========================================
-- 📊 Consultas Básicas em SQL
-- Autor: Bruno de Paula
-- Descrição: Prática com SELECT, filtros e ordenação
-- =========================================

-- Visualizar todos os dados
SELECT *
FROM PETRESCUE;

-- Selecionar colunas específicas
SELECT ANIMAL, QUANTITY, COST
FROM PETRESCUE;

-- Filtrar apenas cachorros
SELECT *
FROM PETRESCUE
WHERE ANIMAL = 'Dog';

-- Filtrar registros com quantidade maior que 1
SELECT *
FROM PETRESCUE
WHERE QUANTITY > 1;

-- Filtrar por múltiplas condições
SELECT *
FROM PETRESCUE
WHERE ANIMAL = 'Cat' AND QUANTITY >= 2;

-- Ordenar por custo (crescente)
SELECT *
FROM PETRESCUE
ORDER BY COST ASC;

-- Ordenar por quantidade (decrescente)
SELECT *
FROM PETRESCUE
ORDER BY QUANTITY DESC;

-- Limitar resultados
SELECT *
FROM PETRESCUE
LIMIT 5;

-- Buscar valores únicos de animais
SELECT DISTINCT ANIMAL
FROM PETRESCUE;

-- Filtrar por mês (ex: maio)
SELECT *
FROM PETRESCUE
WHERE MONTH(RESCUEDATE) = 5;
