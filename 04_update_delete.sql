-- 04_update_delete.sql
-- Comandos UPDATE e DELETE para o banco Bakuna Pets

USE bakunapets_db;

--------------------------------------
-- UPDATE
--------------------------------------

-- 1. Atualizar o status de um animal resgatado para "EM_TRATAMENTO"
UPDATE Animal
SET status = 'EM_TRATAMENTO'
WHERE idAnimal = 2;

-- 2. Corrigir o telefone de um adotante
UPDATE Adotante
SET telefone = '11988889999'
WHERE idAdotante = 1;

-- 3. Atualizar a condição de saúde de um animal
UPDATE Animal
SET condicaoSaude = 'Recuperado e estável'
WHERE idAnimal = 3;

--------------------------------------
-- DELETE
--------------------------------------

-- 4. Remover um item doado incorreto
DELETE FROM ItemDoado
WHERE nomeItem = 'Areia Higiênica' AND quantidade = 3;

-- 5. Excluir registro de participação duplicado
DELETE FROM ParticipacaoEvento
WHERE idEvento = 1 AND idAnimal = 2;

-- 6. Apagar um relatório antigo
DELETE FROM Relatorio
WHERE titulo = 'Relatório Mensal Maio';
