--Cauã Santos Padovani

-- Criação da tabela DEPARTAMENTO sem restrições de integridade
CREATE TABLE DEPARTAMENTO (
    Nome VARCHAR2(50),
    Numero NUMBER(2) PRIMARY KEY,
    RG_Gerente NUMBER(8)
);

-- Criação da tabela EMPREGADO sem restrições de integridade
CREATE TABLE EMPREGADO (
    Nome VARCHAR2(50),
    RG NUMBER(8) PRIMARY KEY,
    CIC NUMBER(8) UNIQUE,
    Depto NUMBER(2),
    RG_Supervisor NUMBER(8),
    Salario NUMBER(10,2)
);

-- Criação da tabela PROJETO
CREATE TABLE PROJETO (
    Nome VARCHAR2(50),
    Numero NUMBER(2) PRIMARY KEY,
    Localizacao VARCHAR2(50)
);

-- Criação da tabela DEPENDENTES sem restrições de integridade
CREATE TABLE DEPENDENTES (
    RG_Responsavel NUMBER(8),
    Nome_Dependente VARCHAR2(50),
    Nascimento DATE,
    Relacao VARCHAR2(10),
    Sexo VARCHAR2(10)
);

-- Criação da tabela DEPARTAMENTO_PROJETO sem restrições de integridade
CREATE TABLE DEPARTAMENTO_PROJETO (
    Numero_Depto NUMBER(2),
    Numero_Projeto NUMBER(2),
    PRIMARY KEY (Numero_Depto, Numero_Projeto)
);

-- Criação da tabela EMPREGADO_PROJETO sem restrições de integridade
CREATE TABLE EMPREGADO_PROJETO (
    RG_Empregado NUMBER(8),
    Numero_Projeto NUMBER(2),
    Horas NUMBER(4),
    PRIMARY KEY (RG_Empregado, Numero_Projeto)
);

-- Inserção de dados na tabela DEPARTAMENTO
INSERT INTO DEPARTAMENTO VALUES ('Contabilidade', 1, 10101010);
INSERT INTO DEPARTAMENTO VALUES ('Engenharia Civil', 2, 30303030);
INSERT INTO DEPARTAMENTO VALUES ('Engenharia Mecânica', 3, 20202020);
INSERT INTO DEPARTAMENTO VALUES ('Recursos Humanos', 4, 60606060);
INSERT INTO DEPARTAMENTO VALUES ('TI', 5, 70707070);

-- Inserção de dados na tabela EMPREGADO
INSERT INTO EMPREGADO VALUES ('João Luiz', 10101010, 11111111, 1, NULL, 3000.00);
INSERT INTO EMPREGADO VALUES ('Fernando', 20202020, 22222222, 2, 10101010, 2500.00);
INSERT INTO EMPREGADO VALUES ('Ricardo', 30303030, 33333333, 2, 10101010, 2300.00);
INSERT INTO EMPREGADO VALUES ('Jorge', 40404040, 44444444, 2, 20202020, 4200.00);
INSERT INTO EMPREGADO VALUES ('Renato', 50505050, 55555555, 3, 20202020, 1300.00);
INSERT INTO EMPREGADO VALUES ('Maria Clara', 60606060, 66666666, 4, NULL, 3500.00);
INSERT INTO EMPREGADO VALUES ('Carlos Alberto', 70707070, 77777777, 5, NULL, 4000.00);
INSERT INTO EMPREGADO VALUES ('Sofia', 80808080, 88888888, 5, 70707070, 2700.00);
INSERT INTO EMPREGADO VALUES ('Paulo Sérgio', 90909090, 99999999, 1, 10101010, 3200.00);
INSERT INTO EMPREGADO VALUES ('Ana Beatriz', 10101011, 12121212, 3, 20202020, 2800.00);

-- Inserção de dados na tabela PROJETO
INSERT INTO PROJETO VALUES ('Financeiro 1', 5, 'São Paulo');
INSERT INTO PROJETO VALUES ('Motor 3', 10, 'Rio Claro');
INSERT INTO PROJETO VALUES ('Prédio Central', 20, 'Campinas');
INSERT INTO PROJETO VALUES ('Sistema de Gestão', 15, 'São Paulo');
INSERT INTO PROJETO VALUES ('Reforma do Prédio', 30, 'Campinas');
INSERT INTO PROJETO VALUES ('Motor Elétrico', 40, 'Rio Claro');
INSERT INTO PROJETO VALUES ('Novo Software', 50, 'São Paulo');

-- Inserção de dados na tabela DEPENDENTES
INSERT INTO DEPENDENTES VALUES (10101010, 'Jorge', TO_DATE('27/12/1986', 'DD/MM/YYYY'), 'Filho', 'Masculino');
INSERT INTO DEPENDENTES VALUES (10101010, 'Luiz', TO_DATE('18/11/1979', 'DD/MM/YYYY'), 'Filho', 'Masculino');
INSERT INTO DEPENDENTES VALUES (20202020, 'Fernanda', TO_DATE('14/02/1969', 'DD/MM/YYYY'), 'Cônjuge', 'Feminino');
INSERT INTO DEPENDENTES VALUES (20202020, 'Ângelo', TO_DATE('10/02/1995', 'DD/MM/YYYY'), 'Filho', 'Masculino');
INSERT INTO DEPENDENTES VALUES (30303030, 'Adreia', TO_DATE('01/05/1990', 'DD/MM/YYYY'), 'Filho', 'Feminino');
INSERT INTO DEPENDENTES VALUES (10101010, 'Amanda', TO_DATE('05/10/2000', 'DD/MM/YYYY'), 'Filha', 'Feminino');
INSERT INTO DEPENDENTES VALUES (30303030, 'Mariana', TO_DATE('02/04/1995', 'DD/MM/YYYY'), 'Filha', 'Feminino');
INSERT INTO DEPENDENTES VALUES (70707070, 'Eduardo', TO_DATE('12/09/2010', 'DD/MM/YYYY'), 'Filho', 'Masculino');
INSERT INTO DEPENDENTES VALUES (80808080, 'Lúcia', TO_DATE('19/03/1987', 'DD/MM/YYYY'), 'Cônjuge', 'Feminino');
INSERT INTO DEPENDENTES VALUES (90909090, 'Felipe', TO_DATE('22/06/2012', 'DD/MM/YYYY'), 'Filho', 'Masculino');

-- Inserção de dados na tabela DEPARTAMENTO_PROJETO
INSERT INTO DEPARTAMENTO_PROJETO VALUES (2, 5);
INSERT INTO DEPARTAMENTO_PROJETO VALUES (2, 10);
INSERT INTO DEPARTAMENTO_PROJETO VALUES (2, 20);
INSERT INTO DEPARTAMENTO_PROJETO VALUES (4, 15);
INSERT INTO DEPARTAMENTO_PROJETO VALUES (5, 40);
INSERT INTO DEPARTAMENTO_PROJETO VALUES (1, 30);
INSERT INTO DEPARTAMENTO_PROJETO VALUES (3, 50);

-- Inserção de dados na tabela EMPREGADO_PROJETO
INSERT INTO EMPREGADO_PROJETO VALUES (20202020, 5, 10);
INSERT INTO EMPREGADO_PROJETO VALUES (20202020, 10, 25);
INSERT INTO EMPREGADO_PROJETO VALUES (30303030, 5, 35);
INSERT INTO EMPREGADO_PROJETO VALUES (40404040, 20, 20);
INSERT INTO EMPREGADO_PROJETO VALUES (50505050, 20, 25);
INSERT INTO EMPREGADO_PROJETO VALUES (60606060, 15, 15);
INSERT INTO EMPREGADO_PROJETO VALUES (70707070, 40, 40);
INSERT INTO EMPREGADO_PROJETO VALUES (80808080, 50, 50);
INSERT INTO EMPREGADO_PROJETO VALUES (10101011, 30, 30);
INSERT INTO EMPREGADO_PROJETO VALUES (99999999, 50, 60);

-- Agora, adicionando as restrições de integridade referencial (chaves estrangeiras)

-- Adicionando a chave estrangeira na tabela EMPREGADO para DEPARTAMENTO
ALTER TABLE EMPREGADO
ADD CONSTRAINT FK_EMPREGADO_DEPARTAMENTO FOREIGN KEY (Depto)
REFERENCES DEPARTAMENTO(Numero);

-- Adicionando a chave estrangeira na tabela EMPREGADO para EMPREGADO (Supervisor)
ALTER TABLE EMPREGADO
ADD CONSTRAINT FK_EMPREGADO_SUPERVISOR FOREIGN KEY (RG_Supervisor)
REFERENCES EMPREGADO(RG);

-- Adicionando a chave estrangeira na tabela DEPENDENTES para EMPREGADO
ALTER TABLE DEPENDENTES
ADD CONSTRAINT FK_DEPENDENTES_RESPONSAVEL FOREIGN KEY (RG_Responsavel)
REFERENCES EMPREGADO(RG);

-- Adicionando a chave estrangeira na tabela DEPARTAMENTO para EMPREGADO (Gerente)
ALTER TABLE DEPARTAMENTO
ADD CONSTRAINT FK_DEPARTAMENTO_GERENTE FOREIGN KEY (RG_Gerente)
REFERENCES EMPREGADO(RG);

-- Adicionando a chave estrangeira na tabela DEPARTAMENTO_PROJETO para DEPARTAMENTO
ALTER TABLE DEPARTAMENTO_PROJETO
ADD CONSTRAINT FK_DEPARTAMENTO_PROJETO_DEPARTAMENTO FOREIGN KEY (Numero_Depto)
REFERENCES DEPARTAMENTO(Numero);

-- Adicionando a chave estrangeira na tabela DEPARTAMENTO_PROJETO para PROJETO
ALTER TABLE DEPARTAMENTO_PROJETO
ADD CONSTRAINT FK_DEPARTAMENTO_PROJETO_PROJETO FOREIGN KEY (Numero_Projeto)
REFERENCES PROJETO(Numero);

-- Adicionando a chave estrangeira na tabela EMPREGADO_PROJETO para EMPREGADO
ALTER TABLE EMPREGADO_PROJETO
ADD CONSTRAINT FK_EMPREGADO_PROJETO_EMPREGADO FOREIGN KEY (RG_Empregado)
REFERENCES EMPREGADO(RG);

-- Adicionando a chave estrangeira na tabela EMPREGADO_PROJETO para PROJETO
ALTER TABLE EMPREGADO_PROJETO
ADD CONSTRAINT FK_EMPREGADO_PROJETO_PROJETO FOREIGN KEY (Numero_Projeto)
REFERENCES PROJETO(Numero);