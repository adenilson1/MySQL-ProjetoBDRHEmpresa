SELECT SUM(SALARIO) AS SALARIO_TOTAL FROM tb_funcionario;

SELECT JSON_EXTRACT(`JSON`,"$.Salario")AS SALARIO
FROM tb_object_funcionario;

SELECT SUM(JSON_EXTRACT(`JSON`,"$.Salario"))AS SALARIO
FROM tb_object_funcionario;

SELECT Numero_Departamento, Sum(SALARIO) AS SALARIO_TOTAL
FROM tb_funcionario
GROUP BY NUMERO_DEPARTAMENTO;


SELECT REPLACE(JSON_EXTRACT(`JSON`,"$.Numero_Departamento"),"""","")AS NUMERO_DEPARTAMENTO,
Sum(JSON_EXTRACT(`JSON`, "$.Salario")) AS SALARIO_TOTAL
FROM tb_object_funcionario
GROUP BY REPLACE(JSON_EXTRACT( `JSON`,"$.Numero_Departamento"),"""","");


SELECT REPLACE(JSON_EXTRACT(`JSON`,"$.Numero_Departamento"),"""","")AS NUMERO_DEPARTAMENTO,
Sum(JSON_EXTRACT(`JSON`, "$.Salario")) AS SALARIO_TOTAL
FROM tb_object_funcionario
GROUP BY REPLACE(JSON_EXTRACT( `JSON`,"$.Numero_Departamento"),"""","")
ORDER BY REPLACE(JSON_EXTRACT( `JSON`,"$.Numero_Departamento"),"""","");








