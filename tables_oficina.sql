

-----------------------------------             SCRIPT CRIAÇÃO DE TABELAS/CONSTRAINTS OFICINA              ----------------------

/* DATABASE OFICINA */

CREATE DATABASE OFICINA; 

/* CRIANDO TABELAS E CONSTRAINTS */

-- TABELA CLIENTE

USE OFICINA;

CREATE TABLE CLIENTE(
  idCLIENTE INT NOT NULL AUTO_INCREMENT,
  Nome VARCHAR(45) NOT NULL,
  CPF CHAR(11) UNIQUE NOT NULL,
  Telefone VARCHAR(45) NOT NULL,
  Email VARCHAR(45),

CONSTRAINT PK_CLIENTES PRIMARY KEY(idCLIENTE)  -- definição da chave primária

);


-- TABELA VEÍCULO

CREATE TABLE VEICULO(
  idVEICULO INT NOT NULL AUTO_INCREMENT, -- chave primária
  Tipo_veículo VARCHAR (45),
  Marca VARCHAR (45),
  Modelo VARCHAR (45) NOT NULL,
  ConsertoRevisão ENUM ('CONSERTO', 'REVISÃO'),
  VEICULO_idCLIENTE INT NOT NULL,-- chave estrangeira

  CONSTRAINT PK_VEICULO PRIMARY KEY (idVEICULO),
  CONSTRAINT FK_VEICULO_CLIENTE FOREIGN KEY (VEICULO_idCLIENTE) REFERENCES CLIENTE (idCLIENTE)

);



-- TABELA ORDEM DE SERVÇO

CREATE TABLE ORDEM_SERVICO(
  idORDEM_SERVICO INT NOT NULL AUTO_INCREMENT, -- chave primária
  Servico_executado VARCHAR(45) NOT NULL,
  Data_emissao DATE NOT NULL,
  Pecas VARCHAR (100) NOT NULL,
  Status ENUM('ABERTA','EM ANDAMENTO','CONCLUÍDA','CANCELADA') NOT NULL,
  Data_entrega DATE NOT NULL,
  
  OS_idCLIENTE INT NOT NULL, -- chave estrangeira
  OS_idVEICULO INT NOT NULL, -- chave estrangeira

  CONSTRAINT PK_ORDEM_SERVICO PRIMARY KEY (idORDEM_SERVICO),
  CONSTRAINT FK_OS_CLIENTE FOREIGN KEY (OS_idCLIENTE) REFERENCES CLIENTE (idCLIENTE),
  CONSTRAINT FK_OS_VEICULO FOREIGN KEY (OS_idVEICULO) REFERENCES VEICULO (idVEICULO)
);


-- TABELA PAGAMENTO

CREATE TABLE PAGAMENTO(
  idPAGAMENTO INT NOT NULL AUTO_INCREMENT,
  Valor VARCHAR(30) NOT NULL,
  Forma_pagamento ENUM('DINHEIRO','DEBITO','CREDITO','PIX'),
  Status ENUM('PAGO','ESPERANDO PAGAMENTO') NOT NULL,

  PAGAMENTO_idCLIENTE INT NOT NULL,  -- chave estrageira
  PAGAMENTO_idORDEM_SERVICO INT NOT NULL, -- chave estrangeira


  CONSTRAINT PK_PAGAMENTO PRIMARY KEY (idPAGAMENTO), -- chave primária
  CONSTRAINT FK_PAGAMENTO_CLIENTE FOREIGN KEY (PAGAMENTO_idCLIENTE) REFERENCES CLIENTE (idCLIENTE), -- chave estrageira tabela cliente
  CONSTRAINT FK_PAGAMENTO_OS FOREIGN KEY (PAGAMENTO_idORDEM_SERVICO) REFERENCES ORDEM_SERVICO (idORDEM_SERVICO) -- chave estrangeira tabela ordem serviço

);


-- TABELA MECANICOS 

CREATE TABLE MECANICOS(
  idMECANICOS INT NOT NULL AUTO_INCREMENT,
  Mecanico VARCHAR (45) NOT NULL,
  Especialidade VARCHAR (45),
  Telefone VARCHAR (45),
  Endereço VARCHAR (45),

  CONSTRAINT PK_MECANICOS PRIMARY KEY (idMECANICOS) -- chave primária
  
);


-- TABELA EQUIPE RESNPOSAVEL

CREATE TABLE EQUIPE_RESPONSAVEL(
  EQUIPE_RESPONSAVEL_id_MECANICOS INT NOT NULL,
  EQUIPE_RESPONSAVEL_id_ORDEM_SERVICO INT NOT NULL,

  CONSTRAINT FK_EQUIPE_RESPONSAVEL_MECANICOS FOREIGN KEY (EQUIPE_RESPONSAVEL_id_MECANICOS) REFERENCES MECANICOS (idMECANICOS),  -- chave estrangeira tabela mecanicos
  CONSTRAINT FK_EQUIPE_RESPONSAVEL_OS FOREIGN KEY (EQUIPE_RESPONSAVEL_id_ORDEM_SERVICO) REFERENCES ORDEM_SERVICO (idORDEM_SERVICO)  -- chave estrangeira tabela ordem de serviço

);


-- TABELA FORNECEDOR

CREATE TABLE FORNECEDOR(
  idFORNECEDOR INT NOT NULL AUTO_INCREMENT,
  Fornecedor VARCHAR(45) NOT NULL,
  Contato VARCHAR(45),
  Endereço VARCHAR(45),

CONSTRAINT PK_FORNECEDOR PRIMARY KEY (idFORNECEDOR)

);

  -- TABELA PEÇAS UTILIZADAS

  CREATE TABLE PECAS_UTILIZADAS(
    PECAS_UTILIZADAS_id_FORNECEDOR INT NOT NULL,
    PECAS_UTILIZADAS_id_ORDEM_SERVICO INT NOT NULL,

    CONSTRAINT FK_PECAS_UTLIZADAS_FORNECEDOR FOREIGN KEY (PECAS_UTILIZADAS_id_FORNECEDOR) REFERENCES FORNECEDOR (idFORNECEDOR),
    CONSTRAINT FK_PECAS_UTLIZADAS_OS FOREIGN KEY (PECAS_UTILIZADAS_id_ORDEM_SERVICO) REFERENCES ORDEM_SERVICO (idORDEM_SERVICO)
  
  );

/* INSERÇÃO DE VALORES */ 

USE OFICINA;

SHOW TABLES;

/* Inserindo Clientes */
INSERT INTO CLIENTE (Nome, CPF, Telefone, Email) VALUES
('João Silva', '12345678901', '11987654321', 'joao@email.com'),
('Maria Oliveira', '23456789012', '21987654321', 'maria@email.com'),
('Carlos Souza', '34567890123', '31987654321', 'carlos@email.com'),
('Ana Pereira', '45678901234', '41987654321', 'ana@email.com'),
('Fernando Lima', '56789012345', '51987654321', 'fernando@email.com'),
('Juliana Costa', '67890123456', '61987654321', 'juliana@email.com'),
('Roberto Nunes', '78901234567', '71987654321', 'roberto@email.com'),
('Tatiane Mendes', '89012345678', '81987654321', 'tatiane@email.com'),
('Ricardo Borges', '90123456789', '91987654321', 'ricardo@email.com'),
('Sandra Ferreira', '01234567890', '11987653210', 'sandra@email.com');

SELECT * FROM CLIENTE;

/*  Inserindo Fornecedores */
INSERT INTO FORNECEDOR (Fornecedor, Contato, Endereço) VALUES
('Auto Peças Silva', '11999999999', 'Rua das Oficinas, 123'),
('Peças Rápidas', '21988888888', 'Av. Mecânica, 456'),
('Motores e Cia', '31977777777', 'Travessa dos Veículos, 789'),
('Ferragens Auto', '41966666666', 'Rua das Peças, 101');

SELECT * FROM FORNECEDOR;

/*  Inserindo Veículos (vinculados aos clientes) */
INSERT INTO VEICULO (Tipo_veículo, Marca, Modelo, ConsertoRevisão, VEICULO_idCLIENTE) VALUES
('Carro', 'Toyota', 'Corolla', 'REVISÃO', 1),
('Moto', 'Honda', 'CB 500', 'CONSERTO', 2),
('Carro', 'Ford', 'Focus', 'REVISÃO', 3),
('Caminhão', 'Volvo', 'FH 460', 'CONSERTO', 4),
('Carro', 'Chevrolet', 'Onix', 'REVISÃO', 5),
('Moto', 'Yamaha', 'Fazer 250', 'CONSERTO', 6),
('Carro', 'Fiat', 'Argo', 'REVISÃO', 7),
('Carro', 'Volkswagen', 'Golf', 'CONSERTO', 8),
('Carro', 'Hyundai', 'HB20', 'REVISÃO', 9),
('Moto', 'Ducati', 'Monster', 'CONSERTO', 10);

SELECT * FROM VEICULO;


/*  Inserindo Ordens de Serviço (vinculadas a clientes e veículos) */
INSERT INTO ORDEM_SERVICO (Servico_executado, Data_emissao, Pecas, Status, Data_entrega, OS_idCLIENTE, OS_idVEICULO) VALUES
('Troca de óleo', '2024-02-01', 'Óleo, Filtro', 'CONCLUÍDA', '2024-02-02', 1, 1),
('Reparo de motor', '2024-02-05', 'Correia dentada, Velas', 'EM ANDAMENTO', '2024-02-10', 2, 2),
('Revisão geral', '2024-02-08', 'Óleo, Filtros, Freios', 'ABERTA', '2024-02-12', 3, 3),
('Troca de embreagem', '2024-02-10', 'Kit embreagem', 'CONCLUÍDA', '2024-02-15', 4, 4),
('Pintura completa', '2024-02-15', 'Tinta, Verniz', 'EM ANDAMENTO', '2024-02-20', 5, 5),
('Alinhamento e balanceamento', '2024-02-20', 'Rodízio pneus', 'CONCLUÍDA', '2024-02-21', 6, 6),
('Troca de bateria', '2024-02-22', 'Bateria 60Ah', 'CONCLUÍDA', '2024-02-22', 7, 7),
('Conserto de suspensão', '2024-02-25', 'Amortecedores, Molas', 'ABERTA', '2024-03-01', 8, 8);

SELECT * FROM ORDEM_SERVICO;

/*  Inserindo  Pagamentos (vinculados a clientes e ordens de serviço) */
INSERT INTO PAGAMENTO (Valor, Forma_pagamento, Status, PAGAMENTO_idCLIENTE, PAGAMENTO_idORDEM_SERVICO) VALUES
('250.00', 'CREDITO', 'PAGO', 1, 1),
('1300.00', 'PIX', 'ESPERANDO PAGAMENTO', 2, 2),
('800.00', 'DEBITO', 'PAGO', 3, 3),
('1200.00', 'DINHEIRO', 'PAGO', 4, 4),
('2000.00', 'CREDITO', 'ESPERANDO PAGAMENTO', 5, 5),
('300.00', 'PIX', 'PAGO', 6, 6),
('400.00', 'DEBITO', 'PAGO', 7, 7),
('700.00', 'DINHEIRO', 'ESPERANDO PAGAMENTO', 8, 8);

SELECT * FROM PAGAMENTO;

/*  Inserindo  Mecânicos */
INSERT INTO MECANICOS (Mecanico, Especialidade, Telefone, Endereço) VALUES
('Carlos Andrade', 'Motor', '11999991111', 'Rua das Engrenagens, 300'),
('Roberto Lopes', 'Suspensão', '21988882222', 'Av. das Motos, 400'),
('Fernanda Almeida', 'Elétrica', '31977773333', 'Rua dos Cabos, 500'),
('José Fernandes', 'Pintura', '41966664444', 'Travessa das Cores, 600'),
('André Silva', 'Freios', '51955555555', 'Rua dos Pneus, 700');

SELECT * FROM MECANICOS;

/*  Inserindo Equipe Responsável (Mecânicos associados às ordens de serviço) */
INSERT INTO EQUIPE_RESPONSAVEL (EQUIPE_RESPONSAVEL_id_MECANICOS, EQUIPE_RESPONSAVEL_id_ORDEM_SERVICO) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (1, 6), (2, 7), (3, 8);

SELECT * FROM EQUIPE_RESPONSAVEL;

/* Inserindo Peças Utilizadas nas ordens de serviço */
INSERT INTO PECAS_UTILIZADAS (PECAS_UTILIZADAS_id_FORNECEDOR, PECAS_UTILIZADAS_id_ORDEM_SERVICO) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (1, 5), (2, 6), (3, 7), (4, 8);

SELECT * FROM PECAS_UTILIZADAS;


/*    PERGUNTAS DE NEGÓCIO/REALIZANDO QUERYS  */


SHOW DATABASES;

USE OFICINA;

SHOW TABLES;

 -- Recuperações simples com SELECT -- 

# Quais são os nomes e telefones de todos os clientes cadastrados?
SELECT Nome, Telefone
FROM CLIENTE;

# Quais são os modelos de veículos cadastrados na oficina?
SELECT DISTINCT Modelo
FROM VEICULO;

# Quais são as ordens de serviço emitidas?
SELECT idORDEM_SERVICO, Servico_executado, Data_emissao
FROM ORDEM_SERVICO;

-- FILTROS COM WHERE -- 

# Quais são os clientes cujo nome começa com a letra "J"?
SELECT *
FROM CLIENTE 
WHERE Nome LIKE 'J%';

# Quais veículos são da marca "Toyota"?
SELECT * 
FROM VEICULO 
WHERE Marca = 'Toyota';

# Quais ordens de serviço ainda estão "EM ANDAMENTO"?
SELECT * 
FROM ORDEM_SERVICO
WHERE Status = 'EM ANDAMENTO';

-- EXPRESSÕES PARA GERAR ATRIBUTOS DERIVADOS -- 

# Qual é o tempo (em dias) entre a emissão e a entrega de cada ordem de serviço?
SELECT idORDEM_SERVICO, Data_emissao, Data_entrega, datediff(Data_Entrega, Data_emissao) AS Dias_para_entrega
FROM ORDEM_SERVICO;

# Exibir o valor dos pagamentos convertidos para um formato numérico (supondo que estejam como VARCHAR).
SELECT idPagamento, cast(Valor AS DECIMAL(10,2)) AS Valor_numerico
FROM PAGAMENTO;

-- ORDENAÇÃO COM ORDER BY --

# Listar os clientes em ordem alfabética.
SELECT * 
FROM CLIENTE
order by Nome ASC;

# Mostrar as ordens de serviço mais recentes primeiro.
SELECT *
FROM ORDEM_SERVICO
ORDER BY Data_emissao DESC;

# Listar pagamentos do maior para o menor valor.
SELECT * 
FROM PAGAMENTO 
ORDER BY CAST(Valor AS DECIMAL(10,2)) DESC;


-- FILTROS EM GRUPO COM HAVING --

# Quantos veículos há de cada marca, considerando apenas marcas com mais de 2 veículos cadastrados?
SELECT Marca, COUNT(*) AS Total_Veiculos
FROM VEICULO
GROUP BY Marca
HAVING COUNT(*) > 2;

# Qual o valor médio dos pagamentos maiores que 1000, considerando apenas os que já foram pagos?
SELECT AVG(CAST(Valor AS DECIMAL(10,2))) AS Valor_Medio
FROM PAGAMENTO
WHERE Status = 'PAGO'
HAVING AVG(CAST(Valor AS DECIMAL(10,2))) > 1000;


-- JOIN ESTRE TABELAS -- 

# Quais veículos pertencem a quais clientes? 
SELECT c.Nome AS Cliente, v.Modelo, v.Marca
FROM VEICULO AS v
JOIN CLIENTE AS c ON v.VEICULO_idCLIENTE = c.idCLIENTE;


# Quais ordens de serviço pertencem a quais clientes?
SELECT c.Nome AS Cliente, os.idORDEM_SERVICO, os.Servico_executado, os.Status
FROM ORDEM_SERVICO AS os
JOIN Cliente as c ON os.OS_idCLIENTE = c.idCLIENTE;

# Listar os mecânicos responsáveis por cada ordem de serviço. 
SELECT m.Mecanico AS MECANICO_RESPONSAVEL, os.Servico_executado
FROM MECANICOS AS m 
JOIN EQUIPE_RESPONSAVEL AS er ON m.idMECANICOS = er.EQUIPE_RESPONSAVEL_id_MECANICOS
JOIN ORDEM_SERVICO AS os ON er.EQUIPE_RESPONSAVEL_id_ORDEM_SERVICO = os.idORDEM_SERVICO;

# Mostrar todas as peças utilizadas por ordem de serviço e seus respectivos fornecedores.
SELECT os.idORDEM_SERVICO, os.Servico_executado, f.Fornecedor
FROM PECAS_UTILIZADAS AS pu
JOIN FORNECEDOR as f ON pu.PECAS_UTILIZADAS_id_FORNECEDOR = f.idFORNECEDOR
JOIN ORDEM_SERVICO as os ON pu.PECAS_UTILIZADAS_id_ORDEM_SERVICO = os.idORDEM_SERVICO;







