USE db_loja; -- seleciona o banco de dados em uso --

SELECT nome_cliente AS "Nome do Cliente", 
sobrenome_cliente AS "Sobrenome do cliente", 
id AS "Código" FROM tb_cliente
ORDER BY sobrenome_cliente DESC; -- asc = crescente -- desc = decrescente

SELECT nome_cliente AS "Nome do Cliente", 
sobrenome_cliente AS "Sobrenome do cliente", 
id AS "Código" FROM tb_cliente
ORDER BY sobrenome_cliente ASC; -- asc = crescente -- desc = decrescente

INSERT INTO tb_cliente VALUES 
(0, "Gonzaga", "Luiza", "F123554", "11999999900", "email11@email.com",0),
(0, "Marques", "Marta", "F121654", "11999919090", "email12@email.com",0),
(0, "Silva", "Dulce", "F121754", "11991909990", "email13@email.com",0);
INSERT INTO tb_cliente VALUES 
(0, "Gonzaga", "Lucas", "F133554", "11993999900", "email14@email.com",0),
(0, "Marques", "Marisa", "F131654", "11993919090", "email15@email.com",0),
(0, "Silva", "Roberto", "F131754", "11991309990", "email16@email.com",0);

INSERT INTO tb_cliente VALUES 
(0, "Ferraz", "Dulce", "F143554", "11993499900", "email17@email.com",0);

SELECT nome_cliente AS "Nome do Cliente", 
sobrenome_cliente AS "Sobrenome do cliente", 
id AS "Código" FROM tb_cliente ORDER BY sobrenome_cliente ASC,  nome_cliente ASC; 
-- ordena por sobrenome e depois os nomes com mesmo sobrenome

-- cria um rank de pontos para os registros over define onde será avaliado o ranking
SELECT id, nome_cliente, sobrenome_cliente, saldo_pontos, RANK() OVER (ORDER BY saldo_pontos DESC) AS ranking FROM tb_cliente;

-- cria partições pelo critério informado, dentro dessas partições faz o ranking
SELECT 
    sobrenome_cliente,
    nome_cliente,
    saldo_pontos,
    RANK() OVER (PARTITION BY sobrenome_cliente ORDER BY saldo_pontos DESC) AS rank_por_sobrenome
FROM 
    tb_cliente;

-- trata melhor os empates
 SELECT 
    nome_cliente, sobrenome_cliente,
    saldo_pontos,
    DENSE_RANK() OVER (PARTITION BY sobrenome_cliente ORDER BY saldo_pontos DESC) AS dense_ranking
FROM 
    tb_cliente;
    
-- diferença entre rank e dense_Rank
SELECT 
    nome_cliente,
    saldo_pontos,
    RANK() OVER (ORDER BY saldo_pontos DESC) AS ranking,
    DENSE_RANK() OVER (ORDER BY saldo_pontos DESC) AS dense_ranking
FROM 
    tb_cliente;
    
    -- cria o rank mas agora ele define todos sem empate
    SELECT id,
    nome_cliente,
    saldo_pontos,
    ROW_NUMBER() OVER (ORDER BY saldo_pontos DESC) AS row_number_ranking
FROM 
    tb_cliente;
    -- diferença entre rank e dense_Rank
SELECT 
    nome_cliente,
    saldo_pontos,
    RANK() OVER (ORDER BY saldo_pontos DESC) AS ranking,
    DENSE_RANK() OVER (ORDER BY saldo_pontos DESC) AS dense_ranking ,
    ROW_NUMBER() OVER (ORDER BY saldo_pontos DESC) AS row_number_ranking
FROM 
    tb_cliente;
    -- 
    
    -- dividir os registros em grupos com critério a coluna informada
   SELECT 
    nome_cliente,
    saldo_pontos,
    NTILE(6) OVER (ORDER BY saldo_pontos DESC) AS grupo
FROM 
    tb_cliente;

-- limitar quantidade de retornos (paginação)
SELECT id,
    nome_cliente,
    saldo_pontos
FROM 
    tb_cliente LIMIT 5;
    
-- passando o valor a partir e quantidade de registros
SELECT id,
    nome_cliente,
    saldo_pontos FROM 
    tb_cliente LIMIT 5,2;
    
-- diferença entre o sum e o count em um group by
SELECT 
saldo_pontos,
count(saldo_pontos) as Conta_pontos, sum(saldo_pontos) as Soma_pontos   FROM
tb_cliente GROUP BY saldo_pontos;

-- usando o group by e o having temos um filtro de quais tuplas vão ser retornadas no sentido de eliminar
-- valores pouco interessantes.
SELECT 
saldo_pontos,
count(saldo_pontos) as Conta_pontos, sum(saldo_pontos) as Soma_pontos   FROM
tb_cliente GROUP BY saldo_pontos HAVING sum(saldo_pontos)> 31;

-- with rollup
SELECT 
    sobrenome_cliente,
    SUM(saldo_pontos) AS total_pontos
FROM 
    tb_cliente
GROUP BY 
    sobrenome_cliente, nome_cliente
WITH ROLLUP ;


INSERT INTO tb_cliente VALUES 
(0, "Gonzaga", "  Caroline ", "F153554", "11993999900", "email18@email.com",0),
(0, "Marques", "  Felipe", "F151654", "11993919090", "email19@email.com",0),
(0, "Silva", "Jorge   ", "F151754", "11991309990", "email20@email.com",0);

SELECT 
    nome_cliente,
    LENGTH(nome_cliente) - LENGTH(REPLACE(nome_cliente, ' ', '')) AS espacos_brancos
FROM 
    tb_cliente;
    
-- limpar espaços em branco 

-- LTRIM(): Remove espaços somente do início da string.
SELECT 
    LTRIM(nome_cliente) AS nome_cliente_limpo
FROM 
    tb_cliente;


-- RTRIM(): Remove espaços somente do final da string.
SELECT 
    RTRIM(nome_cliente) AS nome_cliente_limpo
FROM 
    tb_cliente;
    
-- TRIM(): Remove espaços em branco do início e do final de uma string.
SELECT 
    TRIM(nome_cliente) AS nome_cliente_limpo
FROM 
    tb_cliente;
    
UPDATE tb_cliente
SET nome_cliente = TRIM(nome_cliente);


