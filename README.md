# Banco de dados


## Insert

É um comando do tipo: Manipulação de dados(DML)

### Inserindo um registro no banco de dados

`INSERT INTO TABLE (col) VALUES ("valor")`

Estrutura

Comando = INSERT INTO

Tabela do banco de dados = TABLE

(col) = Colunas do banco de dados -> não obrigatório se você vai passar todos os campos

VALUES = MARCA onde inicia os valores inseridos

("valor") = valor correspondente as colunas, passado na mesma sequencia que passamos as colunas

`INSERT INTO TABLE (col) VALUES ("valor") ,("Valor2"),("Valor3")`

`INSERT INTO TABLE VALUES ("valor") ,("Valor2"),("Valor3")`

* * *

Permite ver o formato da tabela atualmente, suas colunas..

`DESCRIBE TABLE;`

#### NULL
Podemos incluir uma coluna como Null caso necessário, mas caso não informarmos uma coluna e nem seu valor, sendo a mesma uma coluna que permite valores nulos, esta será definida com valor NULL.

`INSERT INTO TABLE (col) VALUES (NULL)`

## SELECT

Estrutura:

SELECT - comando

(*) - colunas

FROM - comando que indica o local onde será realizada a seleção

tb_cliente - nome da tabela do banco de dados que vamos selecionar/retornar os dados

Este comando é utilizado para selecionar/ retornar os dados persistidos em uma tabela.

Podemos passar para esse comando alguns refinamentos para a busca, tornando-a mais assertiva ao objetivo final, como por exemplo definir quais colunas da tabela desejamos ver, quantas e quais linhas de registro queremos ver, entre outros critérios que podem ser aplicados.

`SELECT * FROM tb_cliente; ` retorna todos os registros da tabela que informamos o nome, o * é um coringa para retornar todas as colunas.

`SELECT id,sobrenome_cliente FROM tb_cliente; ` retorna apenas as colunas id e sobrenome_cliente da tabela informada(tb_cliente).

`SELECT id as codigo, sobrenome_cliente as "Sobrenome do Cliente", nome_cliente as Nome FROM tb_cliente; ` retorna apenas as colunas informadas, porém agora passamos um ALIAS, apelido para cada coluna.

```
SELECT id as "código", sobrenome_cliente as "Sobrenome do cliente", 
nome_cliente FROM tb_loyalty WHERE id < 10 group by sobrenome_cliente 
having nome_cliente <>"Maria" order by id ASC;
```
comando cria um filtro onde retorna apenas as colunas id, sobrenome_cliente, nome_cliente onde o id for menor que 10, agrupando por sobrenome(elimina sobrenomes repetidos) e valida se o nome é diferente de Maria, i ainda ordena tudo pelo Id de forma crescente.

## UPDATE
Atualizando os dados de um registro, esse comando tem como objetivo atualizar os registros de uma tupla(linha) ou um conjunto de registros. 

`UPDATE table SET coluna = "valor" WHERE id = 1;`
Atualiza para a tabela informada, colocando para a coluna definida o valor informado, onde o critério do Where for atendido.

OBS: indicamos sempre utilizar um critério ao atualizar registros de uma tabela para evitar situações onde todos os clientes talvez sejam nomeados de teste. 

## DELETE
Deletar registros de uma tabela. Para esse comando indicamos fortemente passar sempre um critério WHERE para evitar apagar todo os registros de uma tabela.

Exemplo:
```
DELETE FROM tabela WHERE id = 1
```
O comando acima vai apagar uma linha do banco de dados onde o id atende o critério de ser igual a 1.

Outros comandos:
SHOW DATABASES;
USE banco-de-dados;
SHOW TABLES;
CREATE DATABASE loyalty_program;
USE loyalty_program;
