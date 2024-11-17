# Model_logic_oficina
Este repositório contém a definição de um banco de dados relacional para um sistema de gestão de oficinas mecânicas.


# Sistema de Gestão para Oficina - Banco de Dados

Este repositório contém a definição de um banco de dados relacional para um sistema de gestão de oficinas mecânicas. O banco de dados foi projetado para atender às principais necessidades administrativas e operacionais de uma oficina, incluindo o gerenciamento de clientes, veículos, serviços, ordens de serviço, fornecedores, peças utilizadas, pagamentos e equipes responsáveis.

## 📋 Estrutura Geral

### Principais Tabelas

O banco de dados é organizado em diversas tabelas que se relacionam entre si para garantir a integridade dos dados. Abaixo, uma visão geral das tabelas:

1. **CLIENTE**
   - Armazena informações sobre os clientes da oficina.
   - Colunas principais:
     - `idCLIENTE` (chave primária)
     - `Nome`, `CPF`, `Telefone`, `E-mail`

2. **VEÍCULO**
   - Registra os veículos dos clientes.
   - Colunas principais:
     - `idVEÍCULO` (chave primária composta)
     - `Tipo de veículo`, `Marca`, `Modelo`, `Conserto/Revisão`
   - Relacionamento:
     - Relacionado à tabela `CLIENTE` via `CLIENTE_idCLIENTE`.

3. **Mecanicos**
   - Gerencia os mecânicos da oficina.
   - Colunas principais:
     - `idMECANICOS` (chave primária)
     - `Mecanico`, `Especialidade`, `Telefone`, `Endereço`

4. **ORDEM DE SERVIÇO**
   - Controla as ordens de serviço realizadas na oficina.
   - Colunas principais:
     - `idORDEM DE SERVIÇO` (chave primária composta)
     - `Cliente`, `Veículo`, `Serviço a ser executado`, `Peças`, `Valor serviço`, `Status`, `Data de entrega`
   - Relacionamento:
     - Relacionado à tabela `VEÍCULO` via `id_CLIENTE`.

5. **FORNECEDOR**
   - Gerencia informações dos fornecedores.
   - Colunas principais:
     - `idFORNECEDOR` (chave primária)
     - `Fornecedor`, `Contato fornecedor`, `Endereço`

6. **PEÇAS UTILIZADAS**
   - Registra as peças utilizadas nas ordens de serviço.
   - Colunas principais:
     - `id_FORNECEDOR` e `id_ORDEM DE SERVIÇO` (chave primária composta)
   - Relacionamentos:
     - Relacionado às tabelas `FORNECEDOR` e `ORDEM DE SERVIÇO`.

7. **PAGAMENTO**
   - Controla os pagamentos das ordens de serviço.
   - Colunas principais:
     - `idPAGAMENTO` (chave primária composta)
     - `Valor`, `Forma de pagamento`, `Status`
   - Relacionamentos:
     - Relacionado à tabela `ORDEM DE SERVIÇO`.

8. **EQUIPE RESPONSÁVEL**
   - Define a equipe responsável por cada ordem de serviço.
   - Colunas principais:
     - `id_MECANICOS` e `id_ORDEM DE SERVIÇO` (chave primária composta)
   - Relacionamentos:
     - Relacionado às tabelas `Mecanicos` e `ORDEM DE SERVIÇO`.

## 🚀 Configuração e Uso

### Pré-requisitos

- **MySQL Server** instalado.
- Um cliente SQL (ex: MySQL Workbench) para executar o script.

### Passo a Passo

1. Clone o repositório:
   ```bash
   git clone https://github.com/seu-usuario/seu-repositorio.git
   ```
2. Importe o arquivo `script.sql` para o seu cliente SQL.
3. Execute o script no banco de dados:
   ```sql
   source path/to/script.sql;
   ```

4. Configure sua aplicação para usar este banco de dados conforme necessário.

## 📄 Relacionamentos

- O banco de dados utiliza chaves primárias e estrangeiras para manter a integridade referencial.
- Os índices otimizam a busca e o relacionamento entre tabelas.

### Diagrama Entidade-Relacionamento

Você pode visualizar o modelo lógico diretamente no MySQL Workbench ou utilizando ferramentas para gerar diagramas ER.

## 📄 Licença

Este projeto está licenciado sob a [Licença MIT](LICENSE). Você pode utilizá-lo, modificá-lo e redistribuí-lo.

