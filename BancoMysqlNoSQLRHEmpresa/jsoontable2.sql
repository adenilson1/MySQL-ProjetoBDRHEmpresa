SELECT JSON_EXTRACT(`JSON`, "$.Dependentes") FROM tb_object_funcionario;
SELECT JSON_EXTRACT(`JSON`, "$.Dependentes[0]") FROM tb_object_funcionario;

SELECT JSON_EXTRACT(`JSON`, "$.Dependentes[0].Nome_Dependente")
FROM tb_object_funcionario; 

SELECT JSON_EXTRACT(`JSON`, "$.Cpf"),
JSON_EXTRACT(`JSON`, "$.Dependentes[0].Nome_Dependente")
FROM tb_object_funcionario; 

SELECT * FROM tb_dependente;

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
PARENTESCO VARCHAR(20) PATH "$.Parentesco")) AS tb_object_dependente;




