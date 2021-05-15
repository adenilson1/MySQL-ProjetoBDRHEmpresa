#Array de JSON
SELECT * FROM tb_dependente
WHERE CPF_FUNCIONARIO = '12345678966';

SELECT JSON_EXTRACT (`JSON`, "$.Dependentes") AS DEPENDENTES 
FROM tb_object_funcionario 
WHERE CPF = '12345678966';

CREATE TABLE t1 (`JSON`json);
INSERT INTO t1 VALUES('{"Hobby":["Praia","Futebol", "Volei"]}');

SELECT `JSON`FROM t1;
SELECT JSON_EXTRACT(`JSON`,"$.Hobby") AS HOBBIES FROM t1;

SELECT JSON_EXTRACT(`JSON`,"$.Hobby[0]") AS HOBBIES FROM t1;
SELECT JSON_EXTRACT(`JSON`,"$.Hobby[1]") AS HOBBIES FROM t1;
SELECT JSON_EXTRACT(`JSON`,"$.Hobby[2]") AS HOBBIES FROM t1;



DROP TABLE t1;
CREATE TABLE t1 (`JSON`json);

INSERT INTO t1 VALUES('{
  "Cliete": [
    {
      "Nome": "João",
      "Hobby": [
        "Praia",
        "Futebol",
        "Volei"
      ]
    }
  ]
}');

SELECT `JSON`FROM t1;

SELECT JSON_EXTRACT (`JSON`,"$.Cliente") FROM t1;

SELECT JSON_EXTRACT (`JSON`,"$.Cliente[0].Nome") FROM t1;

DROP TABLE t1;
CREATE TABLE t1 (`JSON`json);

INSERT INTO t1 VALUES('{
  "Cliente": [
    {
      "Nome": "João",
      "Hobby": [
        "Praia",
        "Futebol",
        "Volei"
      ]
    },
    {
      "Nome": "Carlos",
      "Hobby": [
        "Cinema",
        "Luta"
      ]
    }
    
  ]
}');

SELECT `JSON`FROM t1;
SELECT JSON_EXTRACT (`JSON`,"$.Cliente") FROM t1;
SELECT JSON_EXTRACT (`JSON`,"$.Cliente[0].Nome") FROM t1;
SELECT JSON_EXTRACT (`JSON`,"$.Cliente[1].Nome") FROM t1;

SELECT JSON_EXTRACT (`JSON`,"$.Cliente[0].Hobby") FROM t1;
SELECT JSON_EXTRACT (`JSON`,"$.Cliente[1].Hobby") FROM t1;

SELECT JSON_EXTRACT (`JSON`,"$.Cliente[0].Hobby[1]") FROM t1;
SELECT JSON_EXTRACT (`JSON`,"$.Cliente[1].Hobby[1]") FROM t1;

DROP TABLE t1;
CREATE TABLE t1 (`JSON`json);


SELECT JSON_EXTRACT(`JSON`, "$.Cliente[0].Nome") AS NOME,
JSON_EXTRACT(`JSON`, "$.Cliente[0].Hobby") AS HOBBY  FROM t1
UNION
SELECT JSON_EXTRACT(`JSON`, "$.Cliente[1].Nome") AS NOME,
JSON_EXTRACT(`JSON`, "$.Cliente[1].Hobby")  FROM t1;





