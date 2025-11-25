-- 01_create_schema.sql
-- Criação do banco de dados da ONG Bakuna Pets (MySQL)

DROP DATABASE IF EXISTS bakunapets_db;
CREATE DATABASE bakunapets_db
  DEFAULT CHARACTER SET utf8mb4
  DEFAULT COLLATE utf8mb4_unicode_ci;

USE bakunapets_db;

-- Tabela de animais
CREATE TABLE Animal (
  idAnimal INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(80) NOT NULL,
  especie VARCHAR(40) NOT NULL,
  raca VARCHAR(80),
  sexo ENUM('M','F') NOT NULL,
  idadeAproximada INT,
  status ENUM('RESGATADO','DISPONIVEL','ADOTADO','EM_TRATAMENTO') NOT NULL,
  condicaoSaude VARCHAR(255)
);

-- Tabela de voluntários
CREATE TABLE Voluntario (
  idVoluntario INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  telefone VARCHAR(20),
  areaAtuacao VARCHAR(80)
);

-- Tabela de resgates
CREATE TABLE Resgate (
  idResgate INT AUTO_INCREMENT PRIMARY KEY,
  idAnimal INT NOT NULL,
  idVoluntario INT NOT NULL,
  dataResgate DATE NOT NULL,
  localResgate VARCHAR(120) NOT NULL,
  situacaoInicial VARCHAR(255),
  CONSTRAINT fk_resgate_animal
    FOREIGN KEY (idAnimal) REFERENCES Animal(idAnimal),
  CONSTRAINT fk_resgate_voluntario
    FOREIGN KEY (idVoluntario) REFERENCES Voluntario(idVoluntario)
);

-- Tabela de tratamentos
CREATE TABLE Tratamento (
  idTratamento INT AUTO_INCREMENT PRIMARY KEY,
  idAnimal INT NOT NULL,
  descricao VARCHAR(255) NOT NULL,
  dataInicio DATE NOT NULL,
  dataFim DATE,
  CONSTRAINT fk_tratamento_animal
    FOREIGN KEY (idAnimal) REFERENCES Animal(idAnimal)
);

-- Tabela de vacinas
CREATE TABLE Vacina (
  idVacina INT AUTO_INCREMENT PRIMARY KEY,
  idAnimal INT NOT NULL,
  nomeVacina VARCHAR(100) NOT NULL,
  dataAplicacao DATE NOT NULL,
  lote VARCHAR(40),
  CONSTRAINT fk_vacina_animal
    FOREIGN KEY (idAnimal) REFERENCES Animal(idAnimal)
);

-- Tabela de adotantes
CREATE TABLE Adotante (
  idAdotante INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  cpf VARCHAR(14) NOT NULL,
  telefone VARCHAR(20),
  endereco VARCHAR(150)
);

-- Tabela de adoções
CREATE TABLE Adocao (
  idAdocao INT AUTO_INCREMENT PRIMARY KEY,
  idAnimal INT NOT NULL,
  idAdotante INT NOT NULL,
  dataAdocao DATE NOT NULL,
  termoAssinado TINYINT(1) NOT NULL,
  CONSTRAINT fk_adocao_animal
    FOREIGN KEY (idAnimal) REFERENCES Animal(idAnimal),
  CONSTRAINT fk_adocao_adotante
    FOREIGN KEY (idAdotante) REFERENCES Adotante(idAdotante),
  CONSTRAINT uq_adocao_animal UNIQUE (idAnimal)
);

-- Tabela de doadores
CREATE TABLE Doador (
  idDoador INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  tipoPessoa ENUM('PF','PJ') NOT NULL,
  contato VARCHAR(100)
);

-- Tabela de campanhas
CREATE TABLE Campanha (
  idCampanha INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  objetivo VARCHAR(255),
  dataInicio DATE NOT NULL,
  dataFim DATE,
  valorMeta DECIMAL(10,2),
  valorArrecadado DECIMAL(10,2) DEFAULT 0
);

-- Tabela de doações
CREATE TABLE Doacao (
  idDoacao INT AUTO_INCREMENT PRIMARY KEY,
  idDoador INT NOT NULL,
  idCampanha INT,
  dataDoacao DATE NOT NULL,
  tipoDoacao ENUM('DINHEIRO','ITEM') NOT NULL,
  CONSTRAINT fk_doacao_doador
    FOREIGN KEY (idDoador) REFERENCES Doador(idDoador),
  CONSTRAINT fk_doacao_campanha
    FOREIGN KEY (idCampanha) REFERENCES Campanha(idCampanha)
);

-- Tabela de itens doados
CREATE TABLE ItemDoado (
  idItem INT AUTO_INCREMENT PRIMARY KEY,
  idDoacao INT NOT NULL,
  descricaoItem VARCHAR(100) NOT NULL,
  quantidade INT NOT NULL,
  CONSTRAINT fk_item_doado_doacao
    FOREIGN KEY (idDoacao) REFERENCES Doacao(idDoacao)
);

-- Tabela de eventos
CREATE TABLE Evento (
  idEvento INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  dataEvento DATE NOT NULL,
  localEvento VARCHAR(120) NOT NULL
);

-- Tabela de participação em eventos
CREATE TABLE ParticipacaoEvento (
  idParticipacao INT AUTO_INCREMENT PRIMARY KEY,
  idVoluntario INT NOT NULL,
  idEvento INT NOT NULL,
  papel VARCHAR(80),
  CONSTRAINT fk_participacao_voluntario
    FOREIGN KEY (idVoluntario) REFERENCES Voluntario(idVoluntario),
  CONSTRAINT fk_participacao_evento
    FOREIGN KEY (idEvento) REFERENCES Evento(idEvento)
);

-- Tabela de relatórios
CREATE TABLE Relatorio (
  idRelatorio INT AUTO_INCREMENT PRIMARY KEY,
  tipo VARCHAR(80) NOT NULL,
  periodoInicio DATE NOT NULL,
  periodoFim DATE NOT NULL,
  descricao TEXT
);
