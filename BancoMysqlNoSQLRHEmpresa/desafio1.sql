#NOME DOS FUNCIONARIOS QUE NÃO POSSUEM DEPENDENTES

SELECT F.PRIMEIRO_NOME, F.NOME_MEIO, F.ULTIMO_NOME
FROM tb_funcionario F
LEFT JOIN tb_dependente DEP
ON F.CPF = DEP.CPF_FUNCIONARIO
WHERE DEP.CPF_FUNCIONARIO IS NULL;

#CORRESṔONDENTE A TABELA tb_object_funcionario

SELECT JSON_EXTRACT(tb_object_funcionario.`JSON`, "$.Primeiro_Nome") AS PRIMEIRO_NOME,
JSON_EXTRACT(tb_object_funcionario.`JSON`, "$.Nome_Meio") AS NOME_MEIO,
JSON_EXTRACT(tb_object_funcionario.`JSON`, "$.Ultimo_Nome") AS ULTIMO_NOME
FROM tb_object_funcionario 
LEFT JOIN 
(
SELECT JSON_EXTRACT(tb_object_funcionario.`JSON`, "$.Cpf") AS CPF_FUNCIONARIO,
tb_object_dependente.NOME_DEPENDENTE,
tb_object_dependente.SEXO, tb_object_dependente.DATA_NASCIMENTO,
tb_object_dependente.PARENTESCO
FROM tb_object_funcionario
CROSS JOIN
JSON_TABLE(JSON_EXTRACT(`JSON`, "$.Dependentes"), "$[*]"
COLUMNS (NOME_DEPENDENTE VARCHAR(20) PATH "$.Nome_Dependente",
SEXO VARCHAR(2) PATH "$.Sexo",
DATA_NASCIMENTO DATETIME PATH "$.Data_Nascimento",
PARENTESCO VARCHAR(20) PATH "$.Parentesco")) AS tb_object_dependente
) tb_dependente 
ON JSON_EXTRACT(tb_object_funcionario.`JSON`, "$.Cpf") = tb_dependente.Cpf_Funcionario
WHERE tb_dependente.Cpf_Funcionario IS NULL;

