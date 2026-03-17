
# 🚗 Sistema de Gestão para Oficina Mecânica (Banco de Dados)

Este repositório contém a modelagem e implementação de um banco de dados relacional para um sistema de gestão de oficinas mecânicas.

O objetivo é atender às principais necessidades administrativas e operacionais, incluindo o controle de clientes, veículos, ordens de serviço, peças, fornecedores, pagamentos e equipes.

🔗 **Repositório:**
[https://github.com/felipetamiozzo/Banco-de-Dados-Oficina-SQL](https://github.com/felipetamiozzo/Banco-de-Dados-Oficina-SQL)

---

## 📌 Funcionalidades

* Cadastro de clientes e veículos
* Controle de ordens de serviço
* Gestão de mecânicos e equipes
* Registro de peças utilizadas
* Controle de fornecedores
* Gerenciamento de pagamentos

---

## 🗄️ Estrutura do Banco de Dados

O banco de dados é composto por tabelas relacionais com integridade garantida por chaves primárias e estrangeiras.

### 🧩 Principais Tabelas

#### 👤 CLIENTE

Armazena informações dos clientes.

* `idCLIENTE` (PK)
* `Nome`
* `CPF`
* `Telefone`
* `Email`

---

#### 🚘 VEICULO

Registra os veículos dos clientes.

* `idVEICULO` (PK)
* `Tipo`
* `Marca`
* `Modelo`
* `TipoServico`
* `CLIENTE_idCLIENTE` (FK)

---

#### 🔧 MECANICOS

Cadastro dos mecânicos.

* `idMECANICOS` (PK)
* `Nome`
* `Especialidade`
* `Telefone`
* `Endereco`

---

#### 📋 ORDEM_SERVICO

Gerencia as ordens de serviço.

* `idORDEM_SERVICO` (PK)
* `Cliente`
* `Veiculo`
* `DescricaoServico`
* `ValorServico`
* `Status`
* `DataEntrega`

---

#### 🏭 FORNECEDOR

Dados dos fornecedores.

* `idFORNECEDOR` (PK)
* `Nome`
* `Contato`
* `Endereco`

---

#### 🔩 PECAS_UTILIZADAS

Relaciona peças com ordens de serviço.

* `id_FORNECEDOR` (FK)
* `id_ORDEM_SERVICO` (FK)

---

#### 💳 PAGAMENTO

Controle de pagamentos.

* `idPAGAMENTO` (PK)
* `Valor`
* `FormaPagamento`
* `Status`
* `id_ORDEM_SERVICO` (FK)

---

#### 👥 EQUIPE_RESPONSAVEL

Define os mecânicos responsáveis por cada ordem.

* `id_MECANICOS` (FK)
* `id_ORDEM_SERVICO` (FK)

---

## 🔗 Relacionamentos

* Um **cliente** pode possuir vários veículos
* Um **veículo** pode ter várias ordens de serviço
* Uma **ordem de serviço** pode ter:

  * várias peças
  * vários mecânicos
  * um pagamento associado
* Fornecedores estão ligados às peças utilizadas

---

## ⚙️ Como Utilizar

### ✅ Pré-requisitos

* MySQL Server
* MySQL Workbench (ou outro cliente SQL)

---

### 🚀 Instalação

1. Clone o repositório:

```bash
git clone https://github.com/felipetamiozzo/Banco-de-Dados-Oficina-SQL.git
```

2. Abra o MySQL Workbench (ou outro cliente)

3. Execute o script SQL:

```sql
source caminho/para/script.sql;
```

4. Pronto! O banco estará configurado.

---

## 📊 Diagrama ER

Você pode visualizar o modelo:

* No **MySQL Workbench**
* Ou utilizando ferramentas de modelagem de banco (ex: dbdiagram.io)

---

## 🧠 Boas Práticas Aplicadas

* Normalização do banco de dados
* Uso de chaves primárias e estrangeiras
* Integridade referencial
* Organização modular das entidades

---

## 📄 Licença

Este projeto está sob a licença MIT.
Sinta-se livre para usar, modificar e contribuir.

---

## 🤝 Contribuição

Contribuições são bem-vindas!
Sinta-se à vontade para abrir issues ou pull requests.


