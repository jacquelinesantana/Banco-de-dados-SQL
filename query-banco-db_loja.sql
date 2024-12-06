CREATE DATABASE db_loja;
USE db_loja; -- seleciona o banco de dados em uso --

CREATE TABLE tb_cliente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sobrenome_cliente VARCHAR(100) NOT NULL,
    nome_cliente VARCHAR(100) NOT NULL,
    numero_fidelidade VARCHAR(50) UNIQUE NOT NULL,
    contato VARCHAR(20) NOT NULL,
    email VARCHAR(200) UNIQUE NOT NULL,
    saldo_pontos INT DEFAULT 0
);

SHOW TABLES;

DESCRIBE tb_cliente;

INSERT INTO tb_cliente VALUES (
1, "Silva", "Renata", "F123456", "11999999999", "email@email.com",1200
);

INSERT INTO tb_cliente VALUES (
0, "Souza", "Gustavo", "F123457", "11999999998", "email2@email.com",1250
);

INSERT INTO tb_cliente (email, sobrenome_cliente, numero_fidelidade, nome_cliente, contato )
VALUES (
"email3@email.com","Santos", "F444444","Fernada", "1188888888"
);

INSERT INTO tb_cliente VALUES 
(0, "Gonzaga", "Luiz", "F123454", "11999999990", "email6@email.com",0),
(0, "Marques", "Matheus", "F121154", "11999919990", "email7@email.com",0),
(0, "Lewandowski", "Doofenshmirtz", "F121454", "11991999990", "email8@email.com",0);

SELECT * FROM tb_cliente; -- * todas as colunas --
SELECT nome_cliente AS "Nome do Cliente", sobrenome_cliente AS "Sobrenome do cliente", id AS "Código" FROM tb_cliente;

SELECT nome_cliente AS "Nome do Cliente", 
sobrenome_cliente AS "Sobrenome do cliente", 
id AS "Código" FROM tb_cliente
WHERE saldo_pontos > 0; -- operadores --

SELECT nome_cliente AS "Nome do Cliente", 
sobrenome_cliente AS "Sobrenome do cliente", 
id AS "Código" FROM tb_cliente
WHERE saldo_pontos = 0; -- operadores --

SELECT nome_cliente AS "Nome do Cliente", 
sobrenome_cliente AS "Sobrenome do cliente", 
id AS "Código" FROM tb_cliente
WHERE saldo_pontos = 0 ORDER BY sobrenome_cliente DESC; -- asc = crescente -- desc = decrescente

-- subir dados atraves de um arquivo csv --
LOAD DATA LOCAL INFILE 'C:\Users\Jacqueline\Documents\Generation\dados.csv' 
INTO TABLE tb_cliente 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS 
(sobrenome_cliente, nome_cliente, numero_fidelidade, contato, email, saldo_pontos);

-- update não indicado pq vai alterar tudo --
UPDATE tb_cliente SET sobrenome_cliente ="bittencourt";