-- 03_select_consultas.sql
-- Consultas SQL para o banco de dados Bakuna Pets

USE bakunapets_db;

-- 1. Listar todos os animais disponíveis para adoção
SELECT nome, especie, raca, sexo, idadeAproximada
FROM Animal
WHERE status = 'DISPONIVEL'
ORDER BY nome ASC;

-- 2. Listar todos os animais e suas vacinas (JOIN)
SELECT A.nome AS Animal,
       V.nomeVacina AS Vacina,
       V.dataAplicacao
FROM Animal A
JOIN Vacina V ON A.idAnimal = V.idAnimal
ORDER BY A.nome;

-- 3. Mostrar os animais resgatados com detalhes do resgate
SELECT A.nome, A.especie, R.dataResgate, R.localResgate, R.descricao
FROM Animal A
JOIN Resgate R ON A.idAnimal = R.idAnimal
ORDER BY R.dataResgate DESC;

-- 4. Listar os adotantes e os animais que adotaram
SELECT ADT.nome AS Adotante,
       A.nome AS Animal,
       AC.dataAdocao
FROM Adotante ADT
JOIN Adocao AC ON ADT.idAdotante = AC.idAdotante
JOIN Animal A ON AC.idAnimal = A.idAnimal
ORDER BY AC.dataAdocao DESC;

-- 5. Listar os 5 animais mais jovens
SELECT nome, especie, idadeAproximada
FROM Animal
ORDER BY idadeAproximada ASC
LIMIT 5;
