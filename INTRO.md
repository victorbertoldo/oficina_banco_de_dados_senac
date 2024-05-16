# Oficina de Introducao a Arquitetura de Dados com PostgreSQL

**Para reproduzir este exemplo, basta seguir os passos abaixo:**


## Passo-a-Passo para Importar Dados no PostgreSQL

### 1. Conectar ao Banco de Dados via `psql`

Abra o terminal e conecte-se ao PostgreSQL com o seguinte comando:

```bash
psql -U postgres -d postgres
```

Dependendo da instalacao do Postgres, voce tera que pesquisar na barra de pesquisa do seu sistema operacional, por ``psql``.

2. Agora ja conectado ao banco de dados, vamos criar uma nova estrutura para o nosso projeto:

```bash
CREATE DATABASE escola;

\c escola

CREATE SCHEMA fonte_de_dados;

SET search_path TO fonte_de_dados;
```

3. Agora vamos criar uma tabela para armazenar os dados:

```bash
CREATE TABLE fonte_de_dados.dados_escola (
    numclasse VARCHAR(10),
    professor VARCHAR(50),
    materia VARCHAR(50),
    estudante VARCHAR(100)
);
```

4. Agora vamos popular a tabela com os dados:

```bash
\COPY fonte_de_dados.dados_escola FROM '<caminho>\dados\dados_escola.csv' CSV HEADER;
```

5. Verifique se os dados foram inseridos corretamente:

```bash
SELECT * FROM fonte_de_dados.dados_escola LIMIT 5;
```
Se algo assim aparecer:
# Primeiras 5 Linhas do Dataset

| NumClasse | Professor | Materia   | Estudante    |
|-----------|-----------|-----------|--------------|
| C-10      | Jucelino  | Geografia | João         |
| C-10      | Jucelino  | Geografia | Maria        |
| C-10      | Jucelino  | Geografia | Roberta      |
| C-10      | Jucelino  | Geografia | Pedro        |
| C-10      | Jucelino  | Geografia | Célia        |

**Significa que esta tudo certo ate aqui**
