
-- =========================================
-- 🔗 SQL JOINs - Prática
-- Autor: Bruno de Paula
-- =========================================

-- Tabelas utilizadas:
-- CITY (ID, NAME, COUNTRYCODE)
-- COUNTRY (CODE, NAME, CONTINENT)

-- =========================================
-- 🔹 1. INNER JOIN
-- Objetivo: trazer apenas cidades com países correspondentes
-- =========================================

SELECT
C.NAME AS CITY,
CO.NAME AS COUNTRY
FROM CITY C
INNER JOIN COUNTRY CO
ON C.COUNTRYCODE = CO.CODE;

-- =========================================
-- 🔹 2. LEFT JOIN
-- Objetivo: trazer todas as cidades, mesmo sem país correspondente
-- =========================================

SELECT
C.NAME AS CITY,
CO.NAME AS COUNTRY
FROM CITY C
LEFT JOIN COUNTRY CO
ON C.COUNTRYCODE = CO.CODE;

-- =========================================
-- 🔹 3. RIGHT JOIN
-- Objetivo: trazer todos os países, mesmo sem cidades
-- =========================================

SELECT
CO.NAME AS COUNTRY,
C.NAME AS CITY
FROM CITY C
RIGHT JOIN COUNTRY CO
ON C.COUNTRYCODE = CO.CODE;

-- =========================================
-- 🔹 4. LEFT JOIN + IS NULL (ANTI JOIN)
-- Objetivo: encontrar países que não possuem cidades
-- =========================================

SELECT
CO.NAME AS COUNTRY
FROM COUNTRY CO
LEFT JOIN CITY C
ON C.COUNTRYCODE = CO.CODE
WHERE C.NAME IS NULL;

-- =========================================
-- 🧠 Aprendizados
-- =========================================
-- INNER JOIN → apenas correspondências
-- LEFT JOIN → tudo da esquerda
-- RIGHT JOIN → tudo da direita
-- LEFT JOIN + IS NULL → identificar ausência de relacionamento
