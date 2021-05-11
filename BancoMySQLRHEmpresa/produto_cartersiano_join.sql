#PRODUTO CARTESIANO
SHOW TABLES;
SELECT * FROM TB_FUNCIONARIO
WHERE SEXO = 'F';

SELECT PRIMEIRO_NOME, ULTIMO_NOME, CPF_FUNCIONARIO FROM TB_FUNCIONARIO
WHERE SEXO = 'F';
DESC TB_DEPENDENTE;
SELECT TB_FUNCIONARIO.PRIMEIRO_NOME,
TB_FUNCIONARIO.ULTIMO_NOME,
TB_FUNCIONARIO.CPF_FUNCIONARIO,
TB_DEPENDENTE.* FROM TB_FUNCIONARIO , TB_DEPENDENTE 
WHERE TB_FUNCIONARIO.SEXO = 'F';

SELECT TB_FUNCIONARIO.PRIMEIRO_NOME,
TB_FUNCIONARIO.ULTIMO_NOME,
TB_FUNCIONARIO.CPF_FUNCIONARIO,
TB_DEPENDENTE.* FROM TB_FUNCIONARIO , TB_DEPENDENTE 
WHERE TB_FUNCIONARIO.SEXO = 'F'
AND TB_FUNCIONARIO.CPF_FUNCIONARIO = TB_DEPENDENTE.CPF;

SELECT TB_FUNCIONARIO.PRIMEIRO_NOME,
TB_FUNCIONARIO.ULTIMO_NOME,
TB_FUNCIONARIO.CPF_FUNCIONARIO,
TB_DEPENDENTE.NOME_DEPENDENTE FROM TB_FUNCIONARIO , TB_DEPENDENTE 
WHERE TB_FUNCIONARIO.SEXO = 'F'
AND TB_FUNCIONARIO.CPF_FUNCIONARIO = TB_DEPENDENTE.CPF;

#JUNÇÃO: JOINS
#INNER JOIN - RETORNA SOMENTE QUE TEM CHAVE
#LEFT JOIN - TRAZ TODO DA TABELA DA ESQUERDA COM OS QUE TEM CORRESPONDECIA COM A DIREITA
#RIGHT JOIN - TRAZ TODO DA TABELA DA DIRETIA COM OS QUE TEM CORRESPONDEICA COM A ESQUERDA
#FULL JOIN - RETORNA TODOS OS REGITROS DE TODAS AS TABELAS( OS QUE NAO TEM CORRESPONDECIA FICAM NULOS)
#CROSS JOIN - RETORNA O PRODUTO CARTESIANO DAS TABELAS
DESC TB_PROJETO;
DESC TB_DEPARTAMENTO;
SELECT * FROM TB_DEPARTAMENTO;
SELECT P.NOME_PROJETO, F.PRIMEIRO_NOME
FROM TB_FUNCIONARIO F
INNER JOIN TB_DEPARTAMENTO D
ON F.CPF_FUNCIONARIO = D.CPF
INNER JOIN TB_PROJETO P
ON D.NUMERO_DEPARTAMENTO = P.NUMERO_DEPARTAMENTO;




