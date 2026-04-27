-- =========================================
-- 📊 Exercícios SQL - Prática e Correções
-- Autor: Bruno de Paula
-- =========================================

-- ==============================
-- 🐾 PETRESCUE
-- ==============================

-- Média de custo por unidade para cachorros
SELECT AVG(COST / QUANTITY) AS media_custo
FROM PETRESCUE
WHERE ANIMAL = 'Dog';

-- Tipos de animais (em maiúsculo)
SELECT DISTINCT UCASE(ANIMAL) AS animal
FROM PETRESCUE;

-- Converter 'Cat' para minúsculo
SELECT LCASE(ANIMAL) AS animal
FROM PETRESCUE
WHERE ANIMAL = 'Cat';

-- Buscar gatos (case insensitive)
SELECT *
FROM PETRESCUE
WHERE LCASE(ANIMAL) = 'cat';

-- Soma de animais resgatados em maio
SELECT SUM(QUANTITY) AS total_maio
FROM PETRESCUE
WHERE MONTH(RESCUEDATE) = 5;

-- Data de resgate + 1 ano
SELECT DATE_ADD(RESCUEDATE, INTERVAL 1 YEAR) AS nova_data
FROM PETRESCUE;


-- ==============================
-- 👨‍💼 EMPLOYEES / JOBS
-- ==============================

-- 5 menores salários
SELECT SALARY
FROM EMPLOYEES
ORDER BY SALARY ASC
LIMIT 5;

-- Data de nascimento mais recente
SELECT MAX(B_DATE) AS data_mais_recente
FROM EMPLOYEES;

-- Tempo de serviço por funcionário + média geral
SELECT EMPL_ID,
       YEAR(FROM_DAYS(DATEDIFF(CURRENT_DATE, START_DATE))) AS anos_servico,
       (SELECT AVG(YEAR(FROM_DAYS(DATEDIFF(CURRENT_DATE, START_DATE))))
        FROM JOB_HISTORY) AS media_anos
FROM JOB_HISTORY;

-- Funcionários com cargo Jr. Designer (subquery)
SELECT *
FROM EMPLOYEES
WHERE JOB_ID IN (
    SELECT JOB_IDENT
    FROM JOBS
    WHERE JOB_TITLE = 'Jr.Designer'
);

-- Funcionários com cargo Jr. Designer (JOIN)
SELECT E.*, J.JOB_TITLE
FROM EMPLOYEES E
JOIN JOBS J ON E.JOB_ID = J.JOB_IDENT
WHERE J.JOB_TITLE = 'Jr.Designer';

-- Funcionários nascidos após 1976
SELECT *
FROM EMPLOYEES
WHERE B_DATE >= '1976-01-01';

-- Cargos de funcionários nascidos após 1976
SELECT JOB_TITLE, MIN_SALARY, MAX_SALARY, JOB_IDENT
FROM JOBS
WHERE JOB_IDENT IN (
    SELECT JOB_ID
    FROM EMPLOYEES
    WHERE YEAR(B_DATE) > 1976
);

-- Versão com JOIN
SELECT J.JOB_TITLE, J.MIN_SALARY, J.MAX_SALARY, J.JOB_IDENT
FROM JOBS J
JOIN EMPLOYEES E ON E.JOB_ID = J.JOB_IDENT
WHERE YEAR(E.B_DATE) > 1976;


-- ==============================
-- 📊 VIEWS
-- ==============================

-- Criar view simples
CREATE VIEW EMP_DEPT AS
SELECT EMP_ID, F_NAME, L_NAME, DEP_ID
FROM EMPLOYEES;

-- Atualizar view com join
CREATE OR REPLACE VIEW EMP_DEPT AS
SELECT E.EMP_ID, E.F_NAME, E.L_NAME, D.DEP_NAME
FROM EMPLOYEES E
JOIN DEPARTMENTS D ON E.DEP_ID = D.DEPT_ID;
