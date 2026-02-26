CREATE DATABASE IF NOT EXISTS FlorestaDivertida;
USE FlorestaDivertida;

CREATE TABLE Animais (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL, 
    especie VARCHAR(50),
    idade INT,
    ativo BOOLEAN DEFAULT TRUE
);

CREATE TABLE Visitantes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    idade INT,
    cidade VARCHAR(50)
);

CREATE TABLE Guias (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    especialidade VARCHAR(50),
    salario DECIMAL(7,2)
);

CREATE TABLE Trilhas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    dificuldade VARCHAR(20),
    duracao_min INT,
    guia_id INT, -- Nova coluna de conexão
    FOREIGN KEY (guia_id) REFERENCES Guias(id) ON DELETE SET NULL
);

CREATE TABLE Eventos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    data_evento DATE,
    trilh_id INT,
    FOREIGN KEY (trilh_id) REFERENCES Trilhas(id)
);

CREATE TABLE Avaliacoes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    visitante_id INT,
    trilha_id INT,
    nota INT CHECK(nota BETWEEN 1 AND 5),
    comentario TEXT,
    data_avaliacao DATE,
    FOREIGN KEY (visitante_id) REFERENCES Visitantes(id),
    FOREIGN KEY (trilha_id) REFERENCES Trilhas(id)
);
