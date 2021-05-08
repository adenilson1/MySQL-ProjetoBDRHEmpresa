show DATABASEs;

CREATE SCHEMA EMPRESA;

USE EMPRESA;

SHOW TABLES;


CREATE TABLE TB_FUNCIONARIO (
                CPF VARCHAR(11) NOT NULL,
                DATA_NASCIMENTO DATE NOT NULL,
                PRIMEIRO_NOME VARCHAR(100) NOT NULL,
                NOME_MEIO VARCHAR(100) NOT NULL,
                ULTIMO_NOME VARCHAR(100) NOT NULL,
                ENDERECO VARCHAR(250) NOT NULL,
                SALARIO DOUBLE PRECISION NOT NULL,
                SEXO VARCHAR(1) NOT NULL,
                CPF_FUNCIONARIO VARCHAR(11) NOT NULL,
                NUMERO_DEPARTAMENTO INT NOT NULL,
                PRIMARY KEY (CPF)
);

DESC TB_FUNCIONARIO;


CREATE TABLE TB_DEPARTAMENTO (
                NUMERO_DEPARTAMENTO INT NOT NULL,
                DATA_INICIO_GERENTE DATE NOT NULL,
                NOME_DEPARTAMENTO VARCHAR(50) NOT NULL,
                CPF VARCHAR(11) NOT NULL,
                PRIMARY KEY (NUMERO_DEPARTAMENTO)
);

DESC TB_DEPARTAMENTO;


CREATE TABLE TB_LOCALIZACOES_DEPARTAMENTOS (
                LOCAL VARCHAR(50) NOT NULL,
                NUMERO_DEPARTAMENTO INT NOT NULL
);

DESC  TB_LOCALIZACOES_DEPARTAMENTOS;


CREATE TABLE TB_PROJETO (
                NUMERO_PROJETO INT NOT NULL,
                NOME_PROJETO VARCHAR(50) NOT NULL,
                LOCAL_PROJETO VARCHAR(50) NOT NULL,
                NUMERO_DEPARTAMENTO INT NOT NULL,
                PRIMARY KEY (NUMERO_PROJETO)
);

DESC TB_PROJETO;

CREATE TABLE TB_TRABALHA_EM (
                HORAS INT NOT NULL,
                CPF VARCHAR(11) NOT NULL,
                NUMERO_PROJETO INT NOT NULL
);

DESC TB_TRABALHA_EM;


CREATE TABLE TB_DEPENDENTE (
                NOME_DEPENDENTE VARCHAR(100) NOT NULL,
                SEXO VARCHAR(1) NOT NULL,
                DATA_NASCIMENTO DATE NOT NULL,
                PARENTESCO VARCHAR(50) NOT NULL,
                CPF VARCHAR(11) NOT NULL
);

DESC TB_DEPENDENTE;

ALTER TABLE TB_FUNCIONARIO ADD CONSTRAINT tb_funcionario_tb_funcionario_fk
FOREIGN KEY (CPF_FUNCIONARIO)
REFERENCES TB_FUNCIONARIO (CPF)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE TB_DEPENDENTE ADD CONSTRAINT tb_funcionario_tb_dependente_fk
FOREIGN KEY (CPF)
REFERENCES TB_FUNCIONARIO (CPF)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE TB_TRABALHA_EM ADD CONSTRAINT tb_funcionario_tb_trabalha_em_fk
FOREIGN KEY (CPF)
REFERENCES TB_FUNCIONARIO (CPF)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE TB_DEPARTAMENTO ADD CONSTRAINT tb_funcionario_tb_departamento_fk
FOREIGN KEY (CPF)
REFERENCES TB_FUNCIONARIO (CPF)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE TB_FUNCIONARIO ADD CONSTRAINT tb_departamento_tb_funcionario_fk
FOREIGN KEY (NUMERO_DEPARTAMENTO)
REFERENCES TB_DEPARTAMENTO (NUMERO_DEPARTAMENTO)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE TB_PROJETO ADD CONSTRAINT tb_departamento_tb_projeto_fk
FOREIGN KEY (NUMERO_DEPARTAMENTO)
REFERENCES TB_DEPARTAMENTO (NUMERO_DEPARTAMENTO)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE TB_LOCALIZACOES_DEPARTAMENTOS ADD CONSTRAINT tb_departamento_tb_localizacoes_departamentos_fk
FOREIGN KEY (NUMERO_DEPARTAMENTO)
REFERENCES TB_DEPARTAMENTO (NUMERO_DEPARTAMENTO)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE TB_TRABALHA_EM ADD CONSTRAINT tb_projeto_tb_trabalha_em_fk
FOREIGN KEY (NUMERO_PROJETO)
REFERENCES TB_PROJETO (NUMERO_PROJETO)
ON DELETE NO ACTION
ON UPDATE NO ACTION;