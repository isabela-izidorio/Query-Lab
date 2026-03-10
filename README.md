# Query-Lab 🧪
Laboratório Pessoal de SQL & Modelagem de Dados. Exibindo a evolução técnica desde consultas fundamentais até lógicas complexas. Unindo estruturas sólidas a cenários imaginativos para conectar dados e criatividade.

* ### Estrutura de Diretórios

Este repositório é organizado de forma modular. Cada projeto segue um padrão de diretórios que respeita o ciclo de vida de um banco de dados:

* `01-schema/`: Contém os scripts DDL (*Data Definition Language*). Define a fundação do banco: criação de tabelas, tipos de dados e restrições de chaves.
* `02-seed/`: Scripts DML (*Data Manipulation Language*). Responsável por popular o banco com dados de teste, servindo de insumo para as consultas.
* `03-queries/`: Onde reside a lógica de negócio e os estudos analíticos. (**A subdivisão interna desta pasta pode variar conforme o foco de estudo do projeto**), podendo incluir:
    * `exploratory-queries/`: Consultas de busca, filtros e exploração inicial de dados.
    * `views/`
    * `procedures/`
    * `triggers/`
* `diagrams/`: Documentação visual. Contém os diagramas Entidade-Relacionamento (ER) para facilitar o entendimento da arquitetura e das conexões entre as tabelas.

* ### Como Executar um projeto

Para garantir a integridade referencial e o funcionamento correto da lógica, os scripts devem ser executados na ordem numérica das pastas:

1.  **Schema**: Execute o conteúdo da pasta `01-schema` para criar a estrutura.
2.  **Seed**: Popule as tabelas com os dados contidos na pasta `02-seed`.
3.  **Queries**: Explore as lógicas, visões e automações na pasta `03-queries`.
