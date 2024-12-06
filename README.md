# Banco-de-dados-SQL
Conceitos para banco de dados

# Banco de dados
Sobre o SQL
Existem várias convenções para nomear bancos de dados, tabelas e colunas no SQL. Vou apresentar as práticas mais recomendadas:
Convenções Gerais

1. Clareza e Significado
- Use nomes descritivos
- Evite abreviações confusas
- Escolha nomes que representem o conteúdo/propósito

2. Case Styles
- Snake Case (Mais Recomendado), Palavras separadas por underline, Totalmente minúsculas
Exemplos:
- Banco de dados: sistema_vendas
- Tabela: tb_clientes
- Coluna: nome_completo

3. Camel Case
- Primeira letra minúscula
- Próximas palavras iniciam com maiúscula
 Exemplos:
- Banco de dados: sistemaVendas
- Tabela: tbClientes
- Coluna: nomeCompleto

4. Kebab Case (Menos usado em SQL)
- Palavras separadas por hífen
- Geralmente evitado em SQL
- Exemplo: sistema-vendas

5. Padrões Específicos
Bancos de Dados
- Prefixos opcionais: db_, database_
Exemplos:
- db_comercial
- sistema_financeiro

6. Tabelas

- Prefixos comuns:
    tb_: tabela
    view_: visão
l   og_: tabela de logs        
Exemplos:
- tb_clientes
- tb_produtos
- log_transacoes

7. Colunas
- Evite abreviações
- Use substantivos ou combinações claras
Exemplos:
- nome_cliente
- data_cadastro
- valor_total

8. Boas Práticas
- Consistência, Escolha um estilo e mantenha em todo o projeto
Documente o padrão escolhido

9. Evitar
- Espaços
- Caracteres especiais
- Palavras reservadas do SQL
- Nomes muito longos

10. Singular vs Plural
- Prefira singular para nomes de tabelas
- Exemplo: tb_cliente ao invés de tb_clientes

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

NULL

`INSERT INTO TABLE (col) VALUES (NULL)`

## Popular banco com um CSV

Arquivo CSV
```
sobrenomeCliente,NomeCliente,Numero_fidelidade,Numero_de_contato,Email,Saldo_pontos
Silva,Maria,FL123456,11987654321,maria.silva@email.com,250
Santos,João,FL789012,11976543210,joao.santos@email.com,500
Oliveira,Ana,FL345678,11965432109,ana.oliveira@email.com,100
Pereira,Carlos,FL901234,11954321098,carlos.pereira@email.com,750
Costa,Juliana,FL567890,11943210987,juliana.costa@email.com,350

```

Passo a passo para o import dos dados
1. Criar o arquivo dados.csv `nano dados.csv`
2. Dentro do NANO vamos incluir o conteúdo do arquivo CSV, salvar(CTRL + O) e fechar (CTRL + x)
3. Acessar o gerenciador de banco de dados `mysql -u usuario -p`
4. Criar o banco de dados: ``CREATE DATABASE db_loja;`
5. Selecionar o banco de dados que criamos: `USE db_loja;`
6. Criar a estrutura da tabela: 
```
    CREATE TABLE tb_clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sobrenome_cliente VARCHAR(100) NOT NULL,
    nome_cliente VARCHAR(100) NOT NULL,
    numero_fidelidade VARCHAR(50) UNIQUE NOT NULL,
    contato VARCHAR(20) NOT NULL,
    email VARCHAR(200) UNIQUE NOT NULL,
    saldo_pontos INT DEFAULT 0
); 
```
7. Importar os dados 
```
LOAD DATA LOCAL INFILE '/home/ec2-user/dados.csv' 
INTO TABLE tb_clientes 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS 
(sobrenome_cliente, nome_cliente, numero_fidelidade, contato, email, saldo_pontos);
```
8. Verificar se os dados foram inputados com sucesso:
`SELECT * FROM tb_loyalty;`
9. Caso falhar a importação dos dados verifique:
    a) O caminho que aponta para o seu arquivo csv esta correto?
    b) O nome do arquivo csv esta correto?
    c) Você tem o cal_infile habilitado? Caso não execute comando: `SET GLOBAL local_infile = 1;`
LOAD DATA LOCAL INFILE '/home/ec2-user/dados.csv'

#### Entendendo o código:
linha 1:
`LOAD DATA` : Instrução para carregar dados de um arquivo
`LOCAL`: Permite carregar arquivo do sistema local (computador do cliente)
`INFILE`: Especifica o caminho completo do arquivo CSV
Neste caso, o arquivo está no diretório home do usuário ec2-user

linha 2:
`INTO TABLE tb_clientes`: Define qual tabela receberá os dados importados
Os dados serão inseridos na tabela tb_clientes

linha 3: 
`FIELDS TERMINATED BY ',' `: Indica que os campos no arquivo CSV são separados por vírgula. Define o delimitador de campos

linha 4:
`ENCLOSED BY '"'`: Especifica que os valores dos campos podem estar entre aspas duplas. Útil para campos com vírgulas ou espaços

 linha 5:
`LINES TERMINATED BY '\n'`: Define o fim de cada linha no arquivo
\n representa quebra de linha (standard em arquivos Unix/Linux)

linha 6:
`IGNORE 1 ROWS`: Pula a primeira linha do arquivo
Geralmente usado para ignorar cabeçalhos/títulos das colunas

linha 7:
`(sobrenome_cliente, nome_cliente, numero_fidelidade, contato, email, saldo_pontos)`: Lista os campos da tabela na ordem exata que aparecem no arquivo CSV. Mapeia as colunas do arquivo para as colunas da tabela
A ordem deve corresponder exatamente à ordem no arquivo.

