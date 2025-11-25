-- 02_insert_dados.sql
-- Inserção de dados iniciais para o banco Bakuna Pets

USE bakunapets_db;

-- Inserindo animais
INSERT INTO Animal (nome, especie, raca, sexo, idadeAproximada, status, condicaoSaude)
VALUES
('Luna', 'Gato', 'Siamês', 'F', 2, 'DISPONIVEL', 'Saudável'),
('Tigris', 'Gato', 'Vira-lata', 'M', 1, 'RESGATADO', 'Ferimento leve'),
('Bakugo', 'Gato', 'Persa', 'M', 3, 'EM_TRATAMENTO', 'Doença respiratória');

-- Inserindo voluntários
INSERT INTO Voluntario (nome, telefone, email)
VALUES
('Marina Silva', '11987654321', 'marina@gmail.com'),
('Carlos Nunes', '11999998888', 'carlos@gmail.com');

-- Inserindo resgates
INSERT INTO Resgate (idAnimal, dataResgate, localResgate, descricao)
VALUES
(2, '2024-05-10', 'Rua das Flores', 'Animal encontrado ferido próximo ao mercado'),
(3, '2024-08-15', 'Av. Brasil', 'Gato com dificuldade respiratória');

-- Inserindo vacinas
INSERT INTO Vacina (nomeVacina, dataAplicacao, idAnimal)
VALUES
('V8', '2024-01-10', 1),
('Antirrábica', '2024-02-15', 1),
('V4', '2024-09-01', 3);

-- Inserindo adotantes
INSERT INTO Adotante (nome, telefone, email, endereco)
VALUES
('Patrícia Gomes', '11922223333', 'patricia@gmail.com', 'Rua Alfa, 101'),
('Rogério Dias', '11911112222', 'roger@gmail.com', 'Rua Beta, 202');

-- Inserindo adoções
INSERT INTO Adocao (idAnimal, idAdotante, dataAdocao)
VALUES
(1, 1, '2024-03-20');

-- Inserindo doadores
INSERT INTO Doador (nome, telefone, email)
VALUES
('Fernanda Costa', '11933334444', 'fernanda@gmail.com'),
('Roberto Luiz', '11955556666', 'roberto@gmail.com');

-- Inserindo doações
INSERT INTO Doacao (idDoador, dataDoacao, descricao)
VALUES
(1, '2024-04-05', 'Doação em dinheiro'),
(2, '2024-06-12', 'Doação de alimentos');

-- Inserindo itens doados
INSERT INTO ItemDoado (idDoacao, nomeItem, quantidade)
VALUES
(2, 'Ração 10kg', 2),
(2, 'Areia Higiênica', 3);

-- Inserindo eventos
INSERT INTO Evento (nomeEvento, dataEvento, localEvento)
VALUES
('Feira de Adoção Maio', '2024-05-20', 'Praça Central'),
('Feira de Adoção Outubro', '2024-10-15', 'Shopping Norte');

-- Inserindo participações em eventos
INSERT INTO ParticipacaoEvento (idEvento, idAnimal)
VALUES
(1, 1),
(1, 2),
(2, 3);

-- Inserindo relatórios
INSERT INTO Relatorio (titulo, descricao, dataRelatorio)
VALUES
('Relatório Mensal Maio', 'Resumo das atividades do mês de maio.', '2024-05-31'),
('Relatório Mensal Junho', 'Resumo das atividades do mês de junho.', '2024-06-30');
